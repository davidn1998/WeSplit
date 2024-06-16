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
	
	let tipPercentages = [10, 15, 20, 25, 0]
	
    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format:
							.currency(code: Locale.current.currency?.identifier ?? "USD"))
					.keyboardType(.decimalPad)
					
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
					Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
				}
			}
			.navigationTitle("WeSplit")
		}
		
    }
}

#Preview {
    ContentView()
}
