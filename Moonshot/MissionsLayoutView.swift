//
//  MissionsLayoutView.swift
//  Moonshot
//
//  Created by Zhansen Zhalel on 21.12.2023.
//

import SwiftUI

struct MissionsLayoutView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    let missions: [Mission] = Bundle.main.decode("missions")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showingGrid ? "List" : "Grid") {
                    showingGrid.toggle()
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    MissionsLayoutView()
}
