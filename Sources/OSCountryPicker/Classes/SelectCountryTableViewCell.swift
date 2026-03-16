
import UIKit

class SelectCountryTableViewCell: UITableViewCell {

    @IBOutlet var count: UILabel!
    
    @IBOutlet weak var flag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
