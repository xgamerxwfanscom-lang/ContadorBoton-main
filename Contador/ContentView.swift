import SwiftUI

struct ContentView: View {
    
    @State private var contador = 0
    @State private var texto = ""
    @State private var mostrarSegundaVista = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 25) {
                
              
                VStack(spacing: 8) {
                    
                    Text("Contador de Botones")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Presiona el botón hasta llegar a 5")
                        .foregroundColor(.gray)
                }
                
               
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Escribe algo")
                        .font(.headline)
                    
                    TextField("Ingresa un texto...", text: $texto)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                }
                
               
                VStack(spacing: 10) {
                    
                    Text("\(contador)")
                        .font(.system(size: 65, weight: .bold))
                        .foregroundColor(contador >= 5 ? .green : .blue)
                    
                    Text("Veces presionado")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
                
              
                Button {
                    contador += 1
                    
                    if contador >= 5 {
                        mostrarSegundaVista = true
                    }
                    
                } label: {
                    
                    Text("Presionar")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(contador >= 5 ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .disabled(contador >= 5)
                
              
                HStack(spacing: 15) {
                    
                    Button {
                        contador = 0
                    } label: {
                        
                        Text("Reiniciar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    Button {
                        mostrarSegundaVista = true
                    } label: {
                        
                        Text("Ir")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }
                
                Spacer()
                
              
                NavigationLink(
                    destination: SegundaVista(
                        contador: $contador,
                        texto: texto
                    ),
                    isActive: $mostrarSegundaVista
                ) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Inicio")
        }
    }
}



struct SegundaVista: View {
    
    @Binding var contador: Int
    var texto: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Text("¡Meta alcanzada!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 10) {
                
                Text("Presionaste el botón")
                    .font(.headline)
                
                Text("\(contador) veces")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.blue)
            }
            
            
            if !texto.isEmpty {
                
                VStack(spacing: 8) {
                    
                    Text("Texto ingresado:")
                        .font(.headline)
                    
                    Text("“\(texto)”")
                        .italic()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                }
            }
            
          
            Button {
                contador = 0
                dismiss()
            } label: {
                
                Text("Reiniciar")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
          
            Button {
                dismiss()
            } label: {
                
                Text("Regresar")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .padding()
        .navigationTitle("Resultado")
    }
}

#Preview {
    ContentView()
}
