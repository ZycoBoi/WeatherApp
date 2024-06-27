import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var temperatureText: AttributedString = AttributedString("Loading...")
    @Published var highTemp: String = "--"
    @Published var lowTemp: String = "--"
    @Published var bottomSheetTranslationProrated: Double = 0.0
    @Published var hasDragged: Bool = false
    @Published var weartherRes: WeatherResponse?
    
    private let apiKey = "4b985629fce1e938a49a89952c2897c2"
    private let city = "chennai,IN"
    
    func fetchWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=imperial&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            if let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.updateUI(with: weatherResponse)
                    self.weartherRes = weatherResponse
                }
            }
        }.resume()
    }
    
    private func updateUI(with weatherResponse: WeatherResponse) {
        let temp = weatherResponse.main.temp
        let high = weatherResponse.main.temp_max
        let low = weatherResponse.main.temp_min
        let condition = weatherResponse.weather.first?.main ?? "Clear"
        
        var string = AttributedString("\(Int(temp))°" + (hasDragged ? " | " : "\n ") + condition)
        
        if let tempRange = string.range(of: "\(Int(temp))°") {
            string[tempRange].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight: hasDragged ? .semibold : .thin)
            string[tempRange].foregroundColor = hasDragged ? .white : Color(.systemGray4)
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = Color(.systemGray6).opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: condition) {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = Color(.systemGray3)
        }
        
        self.temperatureText = string
        self.highTemp = String(Int(high))
        self.lowTemp = String(Int(low))
    }
}

 

struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int

    struct Coord: Codable {
        let lon: Double
        let lat: Double
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }

    struct Rain: Codable {
        let _1h: Double
        
        enum CodingKeys: String, CodingKey {
            case _1h = "1h"
        }
    }

    struct Clouds: Codable {
        let all: Int
    }

    struct Sys: Codable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}

