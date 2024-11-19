//
//  ContentView.swift
//  swiftUI-weather
//
//  Created by Hadeel Jamoul on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColorView(isNight: isNight)
            VStack{
                
                CityNameView(cityName: "Syria, Latakia")
                
                MainContentView(isNight: isNight, temprature: 76)
                
                HStack(spacing:20) {
                    
//THERE IS A PROBLEM IN WeatherDayModel
                    
//                    let weatherDays  = [
//                        WeatherDayModel(day: "SUN", image: "cloud.sun.bolt.fill", temprature: 60),
//                        WeatherDayModel(day: "MON", image: "sun.haze.fill", temprature: 70),
//                        WeatherDayModel(day: "TUE", image: "cloud.fog.fill", temprature: 40),
//                        WeatherDayModel(day: "WED", image: "cloud.bolt.fill", temprature: 30),
//                        WeatherDayModel(day: "THU", image: "sun.max.fill", temprature: 80),
//                    ]
                    WetherDaysView(day: "SUN",
                                   image: "cloud.sun.bolt.fill",
                                   temprature: 60)
                    WetherDaysView(day: "MON",
                                   image: "sun.haze.fill",
                                   temprature: 70)
                    WetherDaysView(day: "TUE",
                                   image: "cloud.fog.fill",
                                   temprature: 40)
                    WetherDaysView(day: "WED",
                                   image: "cloud.bolt.fill",
                                   temprature: 30)
                    WetherDaysView(day: "THU",
                                   image: "sun.max.fill",
                                   temprature: 80)
                }
                Spacer()
                Button {
                    isNight.toggle()
                    print("Hello World in swift")
                }
                label :{
                    WeatherButton(text: "Change Day Time",
                                foregroundColor: .white,
                                backgroundColor: .mint)
                }
                Spacer()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CityNameView: View{
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium , design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

//There is no need to use binding with the background cause we are not changing the isNight variable (we only read not write)

struct BackgroundColorView: View {
    
    var isNight: Bool
        
    var body: some View {
    
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
//The original way to add gradient free customization

//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")])
//                       , startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea(.all)
   }
}


struct MainContentView: View{
    
    var isNight: Bool
    var temprature: Int
    
    var body: some View{
        VStack(spacing : 10){
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temprature)°")
                .font(.system(size: 70 ,weight: .medium))
                .foregroundColor(Color.white)
        }
        .padding(.bottom , 40)
    }
}
//struct is a compound data type, meaning it groups together multiple pieces of related data
struct WetherDaysView: View {
    var day: String
    var image: String
    var temprature: Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16 , weight: .medium))
                .foregroundColor(Color.white)
            Image(systemName: image)
                .renderingMode(.original)
                
                //Diffrent Rendering styles
                //.symbolRenderingMode(.hierarchical)
                //.symbolRenderingMode(.palette)
                .resizable()
                
                //.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                //.foregroundStyle(.blue , .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height:40)
            Text("\(temprature)°")
                .font(.system(size: 28 , weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}





