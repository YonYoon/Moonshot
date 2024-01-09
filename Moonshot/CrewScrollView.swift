//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by Zhansen Zhalel on 22.12.2023.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        CrewMemberLabel(crewMember: crewMember)
                    }
                }
            }
            .navigationDestination(for: CrewMember.self) { selection in
                AstronautView(astronaut: selection.astronaut)
            }
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    
    return CrewScrollView(mission: missions[0], astronauts: astronauts)
}

struct CrewMemberLabel: View {
    var crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .scaledToFit()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal)
    }
}
