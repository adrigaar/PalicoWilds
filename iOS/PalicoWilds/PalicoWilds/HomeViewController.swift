
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    private var homeScreenElements: [HomeScreenElement] = []
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let numberOfColumns = 2
    private let numberOfRows = 5
    private let margin = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        getScreenElements()
        collectionView.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func getScreenElements() {
        homeScreenElements = [
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark),
            HomeScreenElement(title: "test", image: UIImage.checkmark)
        ]
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let targetWidth = Double((Int(view.frame.size.width)/numberOfColumns)-margin)
        let targetHeight = Double((Int(view.frame.size.height)/numberOfRows)-margin)
        return CGSize(width: targetWidth, height: targetHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeScreenElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell, homeScreenElements.indices.contains(indexPath.row) else {
            return UICollectionViewCell()
        }
        let element = homeScreenElements[indexPath.row]
        cell.image = element.image
        cell.title = element.title
        
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}
