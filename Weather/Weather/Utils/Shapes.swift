//
//  Shapes.swift
//  Weather
//
//  Created by Dara To on 2022-06-13.
//

import SwiftUI

struct Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX - 1, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX + 1, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX + 1, y: rect.maxY + 1))
        path.addLine(to: CGPoint(x: rect.minX - 1, y: rect.maxY + 1))
        path.closeSubpath()
        
        return path
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.37965*height))
        path.addCurve(to: CGPoint(x: 0.03312*width, y: 0.02995*height), control1: CGPoint(x: 0, y: 0.18083*height), control2: CGPoint(x: 0, y: 0.08142*height))
        path.addCurve(to: CGPoint(x: 0.21492*width, y: 0.04559*height), control1: CGPoint(x: 0.06623*width, y: -0.02153*height), control2: CGPoint(x: 0.1158*width, y: 0.00085*height))
        path.addLine(to: CGPoint(x: 0.9003*width, y: 0.35499*height))
        path.addCurve(to: CGPoint(x: 0.98602*width, y: 0.42173*height), control1: CGPoint(x: 0.94813*width, y: 0.37658*height), control2: CGPoint(x: 0.97204*width, y: 0.38738*height))
        path.addCurve(to: CGPoint(x: width, y: 0.59997*height), control1: CGPoint(x: width, y: 0.45609*height), control2: CGPoint(x: width, y: 0.50405*height))
        path.addLine(to: CGPoint(x: width, y: 0.74857*height))
        path.addCurve(to: CGPoint(x: 0.98116*width, y: 0.96318*height), control1: CGPoint(x: width, y: 0.8671*height), control2: CGPoint(x: width, y: 0.92636*height))
        path.addCurve(to: CGPoint(x: 0.87135*width, y: height), control1: CGPoint(x: 0.96232*width, y: height), control2: CGPoint(x: 0.93199*width, y: height))
        path.addLine(to: CGPoint(x: 0.12865*width, y: height))
        path.addCurve(to: CGPoint(x: 0.01884*width, y: 0.96318*height), control1: CGPoint(x: 0.06801*width, y: height), control2: CGPoint(x: 0.03768*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.74857*height), control1: CGPoint(x: 0, y: 0.92636*height), control2: CGPoint(x: 0, y: 0.8671*height))
        path.addLine(to: CGPoint(x: 0, y: 0.37965*height))
        path.closeSubpath()
        return path
    }
}

struct FloatingButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.42105*width, y: 0.13043*height))
        path.addLine(to: CGPoint(x: 0.57895*width, y: 0.13043*height))
        path.addCurve(to: CGPoint(x: 0.77343*width, y: 0.5539*height), control1: CGPoint(x: 0.69925*width, y: 0.13043*height), control2: CGPoint(x: 0.73497*width, y: 0.34035*height))
        path.addCurve(to: CGPoint(x: 0.98496*width, y: height), control1: CGPoint(x: 0.81325*width, y: 0.775*height), control2: CGPoint(x: 0.85338*width, y: height))
        path.addLine(to: CGPoint(x: 0.01504*width, y: height))
        path.addCurve(to: CGPoint(x: 0.22657*width, y: 0.5539*height), control1: CGPoint(x: 0.14662*width, y: height), control2: CGPoint(x: 0.18675*width, y: 0.775*height))
        path.addCurve(to: CGPoint(x: 0.42105*width, y: 0.13043*height), control1: CGPoint(x: 0.26503*width, y: 0.34035*height), control2: CGPoint(x: 0.30075*width, y: 0.13043*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.42105*width, y: 0.13261*height))
        path.addLine(to: CGPoint(x: 0.57895*width, y: 0.13261*height))
        path.addCurve(to: CGPoint(x: 0.70616*width, y: 0.26348*height), control1: CGPoint(x: 0.63881*width, y: 0.13261*height), control2: CGPoint(x: 0.67756*width, y: 0.18478*height))
        path.addCurve(to: CGPoint(x: 0.77065*width, y: 0.54413*height), control1: CGPoint(x: 0.73387*width, y: 0.33974*height), control2: CGPoint(x: 0.75208*width, y: 0.44091*height))
        path.addCurve(to: CGPoint(x: 0.77256*width, y: 0.55474*height), control1: CGPoint(x: 0.77129*width, y: 0.54766*height), control2: CGPoint(x: 0.77192*width, y: 0.5512*height))
        path.addLine(to: CGPoint(x: 0.77295*width, y: 0.55689*height))
        path.addCurve(to: CGPoint(x: 0.84408*width, y: 0.86129*height), control1: CGPoint(x: 0.79272*width, y: 0.66665*height), control2: CGPoint(x: 0.81271*width, y: 0.77763*height))
        path.addCurve(to: CGPoint(x: 0.95455*width, y: 0.99783*height), control1: CGPoint(x: 0.87058*width, y: 0.93194*height), control2: CGPoint(x: 0.90518*width, y: 0.98308*height))
        path.addLine(to: CGPoint(x: 0.04546*width, y: 0.99783*height))
        path.addCurve(to: CGPoint(x: 0.15592*width, y: 0.86129*height), control1: CGPoint(x: 0.09483*width, y: 0.98308*height), control2: CGPoint(x: 0.12943*width, y: 0.93194*height))
        path.addCurve(to: CGPoint(x: 0.22705*width, y: 0.55688*height), control1: CGPoint(x: 0.1873*width, y: 0.77763*height), control2: CGPoint(x: 0.20728*width, y: 0.66665*height))
        path.addLine(to: CGPoint(x: 0.22744*width, y: 0.55474*height))
        path.addCurve(to: CGPoint(x: 0.22935*width, y: 0.54413*height), control1: CGPoint(x: 0.22808*width, y: 0.5512*height), control2: CGPoint(x: 0.22871*width, y: 0.54766*height))
        path.addCurve(to: CGPoint(x: 0.29384*width, y: 0.26348*height), control1: CGPoint(x: 0.24792*width, y: 0.44091*height), control2: CGPoint(x: 0.26613*width, y: 0.33974*height))
        path.addCurve(to: CGPoint(x: 0.42105*width, y: 0.13261*height), control1: CGPoint(x: 0.32245*width, y: 0.18478*height), control2: CGPoint(x: 0.36119*width, y: 0.13261*height))
        path.closeSubpath()
        path.addEllipse(in: CGRect(x: 0.3797*width, y: 0.23478*height, width: 0.2406*width, height: 0.55652*height))
        path.addEllipse(in: CGRect(x: 0.39098*width, y: 0.26087*height, width: 0.21805*width, height: 0.50435*height))
        path.addEllipse(in: CGRect(x: 0.39135*width, y: 0.26174*height, width: 0.21729*width, height: 0.50261*height))
        path.move(to: CGPoint(x: 0.60902*width, y: 0.51304*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.76522*height), control1: CGPoint(x: 0.60902*width, y: 0.65232*height), control2: CGPoint(x: 0.56021*width, y: 0.76522*height))
        path.addCurve(to: CGPoint(x: 0.39098*width, y: 0.51304*height), control1: CGPoint(x: 0.43979*width, y: 0.76522*height), control2: CGPoint(x: 0.39098*width, y: 0.65232*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.26087*height), control1: CGPoint(x: 0.39098*width, y: 0.37377*height), control2: CGPoint(x: 0.43979*width, y: 0.26087*height))
        path.addCurve(to: CGPoint(x: 0.60902*width, y: 0.51304*height), control1: CGPoint(x: 0.56021*width, y: 0.26087*height), control2: CGPoint(x: 0.60902*width, y: 0.37377*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.40188*width, y: 0.51304*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.74*height), control1: CGPoint(x: 0.40188*width, y: 0.63839*height), control2: CGPoint(x: 0.44581*width, y: 0.74*height))
        path.addCurve(to: CGPoint(x: 0.59812*width, y: 0.51304*height), control1: CGPoint(x: 0.55419*width, y: 0.74*height), control2: CGPoint(x: 0.59812*width, y: 0.63839*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.28609*height), control1: CGPoint(x: 0.59812*width, y: 0.3877*height), control2: CGPoint(x: 0.55419*width, y: 0.28609*height))
        path.addCurve(to: CGPoint(x: 0.40188*width, y: 0.51304*height), control1: CGPoint(x: 0.44581*width, y: 0.28609*height), control2: CGPoint(x: 0.40188*width, y: 0.3877*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.4559*width, y: 0.51416*height))
        path.addCurve(to: CGPoint(x: 0.46371*width, y: 0.53223*height), control1: CGPoint(x: 0.4559*width, y: 0.52415*height), control2: CGPoint(x: 0.45939*width, y: 0.53223*height))
        path.addLine(to: CGPoint(x: 0.49224*width, y: 0.53223*height))
        path.addLine(to: CGPoint(x: 0.49224*width, y: 0.59822*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.61629*height), control1: CGPoint(x: 0.49224*width, y: 0.60808*height), control2: CGPoint(x: 0.49568*width, y: 0.61629*height))
        path.addCurve(to: CGPoint(x: 0.50781*width, y: 0.59822*height), control1: CGPoint(x: 0.50432*width, y: 0.61629*height), control2: CGPoint(x: 0.50781*width, y: 0.60808*height))
        path.addLine(to: CGPoint(x: 0.50781*width, y: 0.53223*height))
        path.addLine(to: CGPoint(x: 0.53634*width, y: 0.53223*height))
        path.addCurve(to: CGPoint(x: 0.5441*width, y: 0.51416*height), control1: CGPoint(x: 0.54061*width, y: 0.53223*height), control2: CGPoint(x: 0.5441*width, y: 0.52415*height))
        path.addCurve(to: CGPoint(x: 0.53634*width, y: 0.49621*height), control1: CGPoint(x: 0.5441*width, y: 0.5043*height), control2: CGPoint(x: 0.54061*width, y: 0.49621*height))
        path.addLine(to: CGPoint(x: 0.50781*width, y: 0.49621*height))
        path.addLine(to: CGPoint(x: 0.50781*width, y: 0.43023*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.41216*height), control1: CGPoint(x: 0.50781*width, y: 0.42036*height), control2: CGPoint(x: 0.50432*width, y: 0.41216*height))
        path.addCurve(to: CGPoint(x: 0.49224*width, y: 0.43023*height), control1: CGPoint(x: 0.49568*width, y: 0.41216*height), control2: CGPoint(x: 0.49224*width, y: 0.42036*height))
        path.addLine(to: CGPoint(x: 0.49224*width, y: 0.49621*height))
        path.addLine(to: CGPoint(x: 0.46371*width, y: 0.49621*height))
        path.addCurve(to: CGPoint(x: 0.4559*width, y: 0.51416*height), control1: CGPoint(x: 0.45939*width, y: 0.49621*height), control2: CGPoint(x: 0.4559*width, y: 0.5043*height))
        path.closeSubpath()
        return path
    }
}


struct floatingButton: View {
    var body: some View{
        ZStack{
            //MARK: Floating Button
            FloatingButtonShape()
                .fill(
                    LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.15, green: 0.17, blue: 0.32), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.24, green: 0.25, blue: 0.45), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.7, y: 1),
                    endPoint: UnitPoint(x: 0.7, y: 0)
                    )
                    )
                .frame(width: 258, height: 100)
//                .foregroundColor(Color("Tab Bar Background 2"))
                .shadow(color: Color(red: 0.46, green: 0.51, blue: 0.96), radius: 2, x: 0, y: 2)
                .ignoresSafeArea()
            ZStack{
                Circle()
                    .fill(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0.4), location: 0.00),
                                Gradient.Stop(color: .white.opacity(0.3), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.18, y: 0.2),
                            endPoint: UnitPoint(x: 0.79, y: 0.92)
                        )
                    ).clipped()
                    .frame(width: 64, height: 64)
                    .blur(radius: 0.5)
                Circle()
                   .fill(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.96, green: 0.96, blue: 0.98), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.85, green: 0.87, blue: 0.91), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.24, y: 0.14),
                            endPoint: UnitPoint(x: 0.78, y: 0.91)
                        )
                    ).clipped()
                    .frame(width: 58, height: 58)
                    .shadow(color: Color(red: 0.05, green: 0.08, blue: 0.19).opacity(0.5), radius: 5, x: 5, y: 5)
//                    .shadow(color: .white.opacity(0.5), radius: 5, x: -10, y: -10)
                
                Circle()
                        .fill(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.96, green: 0.96, blue: 0.98), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.85, green: 0.87, blue: 0.91), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.24, y: 0.14),
                            endPoint: UnitPoint(x: 0.78, y: 0.91)
                        )
                    )
                        .frame(width: 58, height: 58)

                Text("+")
                    .font(
                        Font.custom("SF Pro Display", size: 28)
                            .weight(.bold)
                    )
                    .kerning(0.36)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.systemPurple))
                    .frame(width: 50,alignment: .center)
            }
        }
    }
}
