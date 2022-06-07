//
//  ViewController.swift
//  UICollectionViews
//
//  Created by Cuenta Personal on 8/6/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var myCollectionView: UICollectionView!
	
	private let myCountries = ["España", "Mexico","Perú","Colombia","Argentina","EEUU","Francia","Italia",]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Crear celdas
		myCollectionView.dataSource = self
		// Registramos el tipo de celda en nuestro collection view
		myCollectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
		// Cazamos el click
		myCollectionView.delegate = self
	}


}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return myCountries.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MyCustomCollectionViewCell
		
		cell!.myFirstLabel.text = myCountries[indexPath.row]
		
		
		return cell!
	}
	
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		print("\(indexPath.section) -> \(indexPath.row) \(myCountries[indexPath.row])")
	}
}
