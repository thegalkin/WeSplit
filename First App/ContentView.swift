//
//  ContentView.swift
//  First App
//
//  Created by Никита Галкин on 30.09.2020.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipOption = 2
	
	let tipPercenteges = [10, 15, 20, 25, 0]
	
	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople)
		let tipSelection = Double(tipPercenteges[tipOption])
		let orderAmount =  Double(checkAmount) ?? 0
		let tipValue = orderAmount / 100 * tipSelection
		let grandTotal = orderAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return amountPerPerson
	}
	
	var body: some View {
		NavigationView{
			Form {
				Section {
					TextField("Amount", text:$checkAmount).keyboardType(.numberPad)
					
					Picker("Number of People", selection: $numberOfPeople){
						ForEach(1 ..< 100){
							Text("\($0) people")
						}
					}
				}
				Section(header: Text("How much do you want to leave?")){
					Picker("Tip %", selection: $tipOption){
						ForEach(0 ..< tipPercenteges.count){
							Text("\(tipPercenteges[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Total per person")){
					Text("$\(totalPerPerson, specifier: "%.2f")")
				}
				
			}
			
			.navigationTitle("WeSplit")
			
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
