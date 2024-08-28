import SwiftUI

struct ContentView: View {
    
    let n = 6
    let colors: [Color] = [
        .green,.purple,.cyan,.pink,.teal,.blue,.yellow,.indigo,.orange,.brown
    ]
    
    var delta: Double {
        1 / Double(n)
    }
    
    var body: some View {
        VStack {
            Text("Players")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            ZStack {
                Capsule()
                    .fill(.purple.opacity(0.3))
                ForEach(0 ..< n, id: \.self) { i in
                    let start: Double = delta * Double(i)
                    let end: Double = start + delta
                    let color = colors[i%colors.count]
                    Capsule()
                        .trim(from: start, to: end)
                        .stroke(color, lineWidth: 10)
                        .blur(radius: 25)
                }
                ForEach(0 ..< n, id: \.self) { i in
                    
                    let start: Double = delta * Double(i)
                    let end: Double = start + 0.01
                    let color = colors[i%colors.count]
                    
                    let strokeStyle = {(lineWidth: CGFloat) -> StrokeStyle in StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    }
                    
                    
                    Capsule()
                        .trim(from: start, to: end)
                        .stroke(style: strokeStyle(30))
                        .stroke(color,style: strokeStyle(5))
                }
            }
            .frame(width: 200, height: 300)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
