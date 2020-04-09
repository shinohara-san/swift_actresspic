import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var images: [UIImage] = []
       let imageNames: [String] = ["白石麻衣", "佐野ひなこ", "多部未華子", "石原さとみ", "有村架純", "高畑充希"]

    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = view.frame.width / 3 - 2
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
//       // 画面遷移先に渡す色
    var giveImage: UIImage = UIImage(named: "0")!
//       // 画面遷移先に渡す色の名前
       var giveImageName: String = "白石麻衣"

       override func viewDidLoad() {
           super.viewDidLoad()
//        print(images)
//            UINib(nibName: "UICollectionElementKindCell", bundle:nil)
            while let image = UIImage(named: "\(images.count)") {
                images.append(image)
            }
       }

       // cellの数を返す関数
       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return images.count
       }

       // cellに情報を入れていく関数
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           // Identifierが"CollectionViewCell"でCollectionViewCellというクラスのcellを取得
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell

           // cellのlabelに色付け
        cell.imageView.image = images[indexPath.item]
           // cellのnameに色の名前を入れる
           cell.label.text = imageNames[indexPath.item]

           return cell
       }

       // cell選択時に呼ばれる関数
       // 画面遷移先に渡すデータをここで格納する
       override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           giveImage = images[indexPath.row]
           giveImageName = imageNames[indexPath.row]
           // Identifierが"Segue"のSegueを使って画面遷移する関数
           performSegue(withIdentifier: "Segue", sender: nil)
       }

       // 画面遷移先のViewControllerを取得し、データを渡す
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "Segue" {
               let vc = segue.destination as! ViewController
               vc.receiveImage = giveImage
               vc.receiveImageName = giveImageName
//            print(giveImageName)
           }
       }
}
