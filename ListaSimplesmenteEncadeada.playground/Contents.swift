import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 2/7: 👩🏽‍💻 Lista simplesmente encadeada\n"

print(title)

enum HealthCondition: String {
    case stable = "estável"
    case intensiveTreatment = "em tratamento intensivo"
    case criticalCondition = "em estado crítico"
}

class Patient {
    var name: String
    var identifier: Int
    var healthCondition: HealthCondition

    init(name: String, identifier: Int, healthCondition: HealthCondition) {
        self.name = name
        self.identifier = identifier
        self.healthCondition = healthCondition
    }
}

class Node {
    var Patient: Patient
    var nextPatient: Node?

    init(Patient: Patient) {
        self.Patient = Patient
        self.nextPatient = nil
    }
}

class ListPatient {
    var head: Node?

    func add(Patient: Patient) {
        let newNode = Node(Patient: Patient)
        if head == nil {
            head = newNode
        } else {
            var currentNode = head
            while currentNode?.nextPatient != nil {
                currentNode = currentNode?.nextPatient
            }
            currentNode?.nextPatient = newNode
        }
    }

    func remove(Patient: Patient) {
        if head == nil { return }

        if !patientAlreadyExists(Patient: Patient) {
            Swift.print("\nO paciente: \(Patient.name) informado para remoção não foi encontrado.")
        } else {
            if head?.Patient === Patient {
                head = head?.nextPatient
                return
            }

            var currentNode = head
            var previousNode: Node?

            while currentNode != nil, currentNode?.Patient !== Patient {
                previousNode = currentNode
                currentNode = currentNode?.nextPatient
            }

            previousNode?.nextPatient = currentNode?.nextPatient
        }
    }

    func patientAlreadyExists(Patient: Patient) -> Bool {
        var current = head
        while current != nil {
            if current?.Patient === Patient {
                return true
            }
            current = current?.nextPatient
        }
        return false
    }

    func print() {
        Swift.print("")
        var current = head
        while current != nil {
            let Patient = current!.Patient
            Swift.print("Paciente: \(Patient.name), Identificação: \(Patient.identifier), Estado de saúde: \(Patient.healthCondition.rawValue)")
            current = current?.nextPatient
        }
    }
}

var estado = HealthCondition.intensiveTreatment

// Adiona Patients
var patient1 = Patient(name: "João Silva", identifier: 1231, healthCondition: HealthCondition.criticalCondition)
var patient2 = Patient(name: "Irene Cardozo", identifier: 1564, healthCondition: HealthCondition.stable)
var patient3 = Patient(name: "Ronaldo Santana", identifier: 999, healthCondition: HealthCondition.intensiveTreatment)
var patient4 = Patient(name: "Maria Tereza", identifier: 1777, healthCondition: HealthCondition.criticalCondition)

var patientTest = Patient(name: "test", identifier: 32, healthCondition: HealthCondition.criticalCondition)

var listPatients = ListPatient()
listPatients.add(Patient: patient1)
listPatients.add(Patient: patient2)
listPatients.add(Patient: patient3)
listPatients.add(Patient: patient4)
listPatients.add(Patient: patientTest)
listPatients.print()

print("\n")

listPatients.remove(Patient: patient1)

listPatients.print()

listPatients.remove(Patient: patientTest)
listPatients.print()
