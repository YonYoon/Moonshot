//
//  GridLayout.swift
//  Moonshot
//
//  Created by Zhansen Zhalel on 22.12.2023.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in                    
                    NavigationLink(value: mission) {
                        GridLabel(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationDestination(for: Mission.self) { selection in
                MissionView(mission: selection, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    let missions: [Mission] = Bundle.main.decode("missions")
    
    return GridLayout(astronauts: astronauts, missions: missions)
}

struct GridLabel: View {
    var mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}
