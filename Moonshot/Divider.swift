//
//  Divider.swift
//  Moonshot
//
//  Created by Zhansen Zhalel on 22.12.2023.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    Divider()
}
