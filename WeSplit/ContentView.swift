//
//  ContentView.swift
//  WeSplit
//
//  Created by David Nwachukwu on 16/06/2024.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	@FocusState private var amountIsFocused: Bool
	
	let tipPercentages = [10, 15, 20, 25, 0]
	
	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople)
		let tipPercentage = Double(tipPercentage)
		
		let tipValue = checkAmount * (tipPercentage / 100)
		let grandTotal = checkAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return amountPerPerson
	}
	
    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format:
							.currency(code: Locale.current.currency?.identifier ?? "USD"))
							.keyboardType(.decimalPad)
							.focused($amountIsFocused)
					
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2..<100, id: \.self) {
							Text("\($0) people")
						}
					}
				}
				
				Section {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(tipPercentages, id: \.self) {
							Text($0, format: .percent)
						}
					}
					.pickerStyle(.segmented)
				} header: {
					Text("How much tip do you want to leave?")
				}
				
				Section {
					Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
				} header: {
					Text("Total per person")
				}
			}
			.navigationTitle("WeSplit")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					
					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
		
    }
}

#Preview {
    ContentView()
}
