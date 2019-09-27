
import UIKit


protocol OSCountryDidSelectCountry: class {
    func data(country: String,Code: String , Id: String, iso: String, flag : UIImage?)
}


class SelectCountryViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    //MARK: OUTLETS
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet var searchField: UITextField!
    
    @IBOutlet weak var searchIcon: UIImageView!
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var searchViewHeight: NSLayoutConstraint!
    
    //MARK: VARIABLES
    var countryArray : NSArray?
    var searchArray : NSArray?
    
    weak var delegate: OSCountryDidSelectCountry?
    
    var screen = ""
    
    enum filters : String {
        case Name       = "name"
        case code      =  "iso"
    }
    
    enum countryLanguage : String {
        case English       = "english_Count"
        case Russian      =  "Russian_Count"
        case Japanese      =  "Japanese_Count"
        case Chinese      =  "chinese_Count"
        case Malay      =  "Malay_Count"
        case Thai      =  "Thai_Count"
        case Korean      =  "Korean_Count"
        case Spanish      =  "Spanish_Count"
        case Vietnamese      =  "Vietnamese_Count"
    }

    var searchFilters = [filters]()
    
    var language = countryLanguage.English
    
    
    var searchTint = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchView.clipsToBounds = true
        
        searchField.becomeFirstResponder()
        self.countryArray = self.getCountries()
        self.searchArray = self.countryArray
        self.searchViewHeight.constant = 40
        self.searchField.tintColor = self.searchTint
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.tableFooterView = UIView()
        
        
        self.table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        self.searchView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func getCountries() -> NSArray?{
        let file = self.language.rawValue
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                guard let dataFile = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray else {
                    print("serialization failed in get country code data")
                    return  nil
                }
                return dataFile
                
            } catch let error {
                print(error.localizedDescription)
                return  nil
                
            }
        } else {
            print("Invalid filename/path.")
            return  nil
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //MARK: BUTTONS ACTIONS
    
    
    @IBAction func didChange(_ sender: UITextField) {
        if sender.text?.isEmpty == true{
            self.searchArray = self.countryArray
        }else{
            if self.searchFilters.count == 2{
                self.searchArray = (self.countryArray as? [[String:Any]])?.filter({(($0["name"] as? String)?.lowercased().contains(sender.text!.lowercased()) == true) || (($0["code"] as? String)?.lowercased().contains(sender.text!.lowercased()) == true)}) as NSArray?
            } else if self.searchFilters.contains(.code ){
                self.searchArray = (self.countryArray as? [[String:Any]])?.filter({(($0["code"] as? String)?.lowercased().contains(sender.text!.lowercased()) == true)}) as NSArray?
            } else{
                self.searchArray = (self.countryArray as? [[String:Any]])?.filter({(($0["name"] as? String)?.lowercased().contains(sender.text!.lowercased()) == true)}) as NSArray?
            }
            
        }
        self.table.reloadData()
    }
    
    
    
    
    
    
    //MARK: TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCountryTableViewCell")as! SelectCountryTableViewCell
        let dict = self.searchArray?[indexPath.row] as? [String:Any]
        let text = "+\(dict?["code"] as? String ?? "") \(dict?["name"] as? String ?? "")"
        cell.count.text = text
        cell.flag.image = UIImage(named: (dict?["iso"]as? String ?? "").uppercased())
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = self.searchArray?[indexPath.row] as? [String:Any]
        let count =  dict?["name"] as? String ?? ""
        let cod =  dict?["code"] as? String ?? ""
        let ID = dict?["id"] as? String ?? ""
        let iso = dict?["iso"] as? String ?? ""
        self.delegate?.data(country: count, Code: cod , Id: ID , iso: iso, flag: UIImage(named: (dict?["iso"]as? String ?? "").uppercased()))
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
