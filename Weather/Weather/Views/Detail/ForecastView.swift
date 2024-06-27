//
//  ForecastView.swift
//  Weather
//
//  Created by Dara To on 2022-06-17.
//

import SwiftUI
import Combine

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    @StateObject private var weatherViewModel = WeatherViewModel()
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // MARK: Segmented Control
                SegmentedControl(selection: $selection)
                
                // MARK: Forecast Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(Forecast.daily) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                // MARK: Forecast Widgets
                LazyVGrid(columns: columns, spacing: 20) {
                    Card_Widget(image: "cloud.rain", title: "RAINFALL", content: "\(weatherViewModel.weartherRes?.rain?._1h ?? 0)", description: "1.2mm Expected \n in next 24th")
                    Card_Widget(image: "thermometer", title: "FELLS LIKE", content: "\(weatherViewModel.weartherRes?.main.feels_like ?? 0)", description: "Similar To the actual \n temperature")
                    Card_Widget(image: "wind.snow", title: "WIND SPEED", content: "\(weatherViewModel.weartherRes?.wind.speed ?? 0 )", description: "Similar To the actual \n temperature")
                    Card_Widget(image: "tornado", title: "HUMIDITY", content: "\(weatherViewModel.weartherRes?.main.humidity ?? 0 )", description: "Similar To the actual \n temperature")
                    Card_Widget(image: "light.min", title: "VISIBILITY", content: "\(weatherViewModel.weartherRes?.visibility ?? 0)", description: "Similar To the actual \n temperature")
                }
                     .opacity(bottomSheetTranslationProrated)
            }
        }
        .onAppear{
            weatherViewModel.fetchWeather()
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
