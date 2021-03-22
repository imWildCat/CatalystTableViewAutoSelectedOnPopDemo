// 

import UIKit

private let data = [
  "Foo",
  "Bar",
  "Baz"
]

class SideBarListViewController: UITableViewController {
  
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
    
    snapshot.appendItems(data)
    
    diffableDS.apply(snapshot, animatingDifferences: true)
  }


  // MARK: - Delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let secondListVC = SideBarSecondLevelListViewController()
    
    navigationController?.pushViewController(secondListVC, animated: true)
  }
}

