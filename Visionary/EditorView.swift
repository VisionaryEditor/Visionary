//
//  EditorView.swift
//  Visionary
//
//  Created by Silverstar A. Carlson on 26/07/2024.
//

import SwiftUI
import AVKit

struct EditorView: View {
    var width: CGFloat = 640
    var height: CGFloat = 360
    
    @State private var player: AVPlayer?
    @State private var progress: Double = 0
    @State private var markers: [Double] = []
    @State private var zoomLevel: Double = 1.0
    
    var body: some View {
        VStack {
            VideoPlayer(player: player).frame(height: 200)

            Slider(value: $progress, in: 0...1).frame(height: 20)
                .overlay(Circle()
                    .frame(width: 20, height: 20)
                    .offset(x: progress * -20)).overlay(
                        ForEach(markers, id: \.self) { marker in Rectangle(); frame(width: 2, height: 20).offset(x: marker * -20)
                            }
                        )
            HStack {
                Button("Zoom In") { zoomLevel += 0.5 }
                Button("Zoom Out") { if zoomLevel > 1.0 { zoomLevel -= 0.5 } }
                Button("Add Marker") { markers.append(progress) }
                Button("Remove Marker") { if !markers.isEmpty { markers.removeLast() } }
            }
        }
    }
}

#Preview {
    EditorView(width: 640, height: 360)
}
