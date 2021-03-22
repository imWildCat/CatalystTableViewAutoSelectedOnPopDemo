//

import UIKit

private let data2 = [
  "Foo in second level list",
  "Bar in second level list",
  "Baz in second level list"
]

class SideBarSecondLevelListViewController: UITableViewController {
  
  private var diffableDS: UITableViewDiffableDataSource<Int, String>!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Sidebar"

    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    diffableDS = UITableViewDiffableDataSource<Int, String>(tableView: self.tableView) { (tableView, indexPath, rowData) -> UITableViewCell? in
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
      cell.textLabel?.text = rowData
      
      return cell
    }
    
    tableView.dataSource = diffableDS
    
    applyData()
  }
  
  private func applyData() {
    var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
    
    snapshot.appendSections([0])
    
    snapshot.appendItems(data2)
    
    diffableDS.apply(snapshot, animatingDifferences: true)
  }


}

