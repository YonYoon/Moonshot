//
//  ListLayout.swift
//  Moonshot
//
//  Created by Zhansen Zhalel on 22.12.2023.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in                
                NavigationLink(value: mission) {
                    ListLabel(mission: mission)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .navigationDestination(for: Mission.self) { selection in
            MissionView(mission: selection, astronauts: astronauts)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    let missions: [Mission] = Bundle.main.decode("missions")
    
    return ListLayout(astronauts: astronauts, missions: missions)
}

struct ListLabel: View {
    var mission: Mission
    
    var body: some View {
        HStack(spacing: 20) {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}
