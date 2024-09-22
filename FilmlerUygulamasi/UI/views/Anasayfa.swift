//
//  ViewController.swift
//  FilmlerUygulamasi
//
//  Created by Rasim Egi on 22.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    var filmlerListesi = [Filmler]() //dizi oluşturuyoruz ve filmler class ından nesnelere olacağını belirttik
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Filmler"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 18)
        let f4 = Filmler(id: 4, ad: "The HAteful Eight", resim: "thehatefuleight", fiyat: 12)
        let f5 = Filmler(id: 1, ad: "The Pianist", resim: "thepianist", fiyat: 20)
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //çevre boşluğu
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10 // dikey boşluk
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        // yüksekliği istediğin gibi ayarlarsın
        filmlerCollectionView.collectionViewLayout = tasarim
    }


}
extension Anasayfa : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerCell", for: indexPath) as! FilmlerCell
        
        cell.imageView.image = UIImage(named: film.resim!)
        cell.fiyatLabel.text = ("\(film.fiyat!) TL")
        
        cell.layer.borderColor = UIColor.lightGray.cgColor //layer hücrenin arkasına erişiyor
        cell.layer.borderWidth = 0.3 //genişliği
        cell.layer.cornerRadius = 10.0 //köşe kıvrımı ekle
        
        return cell
    }
}
