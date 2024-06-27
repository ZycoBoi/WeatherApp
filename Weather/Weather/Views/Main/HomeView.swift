//
//  HomeView.swift
//  Weather
//
//  Created by Dara To on 2022-06-12.
//

import SwiftUI
import BottomSheet
import Combine

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    @StateObject private var weatherViewModel = WeatherViewModel()
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                ZStack {
                    // MARK: Background Color
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: Current Weather
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text(weatherViewModel.weartherRes?.name ?? " ")
                            .font(.largeTitle)
                        
                        VStack {
                            Text(weatherViewModel.temperatureText)
                            
                            Text("H: \(weatherViewModel.highTemp)°   L: \(weatherViewModel.lowTemp)°")
                                                .font(.title3.weight(.semibold))
                                                .opacity(1 - weatherViewModel.bottomSheetTranslationProrated)
                        }
                        
                        Spacer()
                    }.foregroundColor(.white)
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    // MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetPosition.top {
                                hasDragged = true
                            } else {
                                hasDragged = false
                            }
                        }
                    }.edgesIgnoringSafeArea(.bottom)
                    
                    // MARK: Tab Bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
            }
            .navigationBarHidden(true)
        }.onAppear{
            weatherViewModel.fetchWeather()
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("\(weatherViewModel.weartherRes?.name ?? " ")°" + (hasDragged ? " | " : "\n ") + "\(weatherViewModel.temperatureText)")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .white : Color(.systemGray4)
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = Color(.systemGray6).opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: "\(weatherViewModel.temperatureText)") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = Color(.systemGray3)
        }
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
