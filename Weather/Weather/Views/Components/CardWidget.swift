//
//  Card Widget.swift
//  Weather
//
//  Created by sankar on 27/06/24.
//

import SwiftUI

struct Card_Widget: View {
    
    var image: String
    var title: String
    var content: String
    var description : String
    
    var body: some View {
                    VStack(alignment: .center, spacing: 0) {
                HStack(spacing: 5) {
                    Image(systemName: image)
                        .font(.subheadline)
                        .foregroundColor(Color(.systemGray4))
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.systemGray4))
                    Spacer()
                }.padding(.bottom, 5)
                HStack {
                    Text(formattedContent)
                        .font(.system(size: 55).weight(.semibold))
                        .foregroundColor(Color(.systemGray6))
                        .padding(.bottom, 10)
                    Spacer()
                }
                        HStack {
                            Text(description)
                                .font(.caption)
                                .foregroundColor(Color(.systemGray5))
                            Spacer()
                        }
               
                    
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .frame(width: 164, height: 164)
            .background(Color(red: 0.28, green: 0.19, blue: 0.62).opacity(0.2))

            .cornerRadius(22)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 5, y: 4)
            .overlay(
            RoundedRectangle(cornerRadius: 30)
            .inset(by: 0.5)
            .stroke(.white.opacity(0.2), lineWidth: 1)

            )

        
    }
    private var formattedContent: String {
            if content.count > 4 {
                return String(content.prefix(4))
            } else {
                return content
            }
        }
}

