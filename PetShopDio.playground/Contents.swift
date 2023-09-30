import UIKit
import Dispatch

enum PetshopAction: Int {
    case cirurgia
    case banho
    case tosa
    case consulta
    case sair
}

protocol Animal {
    var nome: String { get }
    var especie: String { get }
    
    func makeAnAppointment(_ action: PetshopAction)
}

extension Animal {
    func makeAnAppointment(_ action: PetshopAction) {
        print("\nRealizando ação no \(especie) \(nome):")
        switch action {
        case .cirurgia:
            print("Cirurgia realizada.")
        case .banho:
            print("Banho dado.")
        case .tosa:
            print("Tosa feita.")
        case .consulta:
            print("Consulta realizada.")
        case .sair:
            print("Saindo do petshop.")
        }
    }
}

struct Cachorro: Animal {
    let nome: String
    let especie: String = "Cachorro"
}

struct Gato: Animal {
    let nome: String
    let especie: String = "Gato"
}

struct Passaro: Animal {
    let nome: String
    let especie: String = "Passaro"
}

func multipleTasks(_ animal: Animal, _ actions: [PetshopAction]) {
    let group = DispatchGroup()
    let queue = DispatchQueue.global(qos: .default)
    
    for action in actions {
        group.enter()
        
        queue.async {
            animal.makeAnAppointment(action)
            group.leave()
        }
    }
    
    group.wait()
}

func criarAnimal(_ escolha: Int) -> Animal? {
    switch escolha {
    case 1:
        return Cachorro(nome: "Shrek")
    case 2:
        return Gato(nome: "Garfield")
    case 3:
        return Passaro(nome: "Fenix")
    default:
        return nil
    }
}


if let animal = criarAnimal(2) {
    animal.makeAnAppointment(.banho)
    multipleTasks(animal, [.consulta, .cirurgia])
}


