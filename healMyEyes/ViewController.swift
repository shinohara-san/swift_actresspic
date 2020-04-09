import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    // CollectionViewControllerから渡される色のデータ
    var receiveImage: UIImage = UIImage(named: "0")!
    var receiveImageName: String = "白石麻衣"

    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景の色を渡された色にする
        imageView.image = receiveImage
        // NavigationItemと呼ばれる一番上のバーに色の名前を入れる
        self.navigationItem.title = receiveImageName
    }
}
