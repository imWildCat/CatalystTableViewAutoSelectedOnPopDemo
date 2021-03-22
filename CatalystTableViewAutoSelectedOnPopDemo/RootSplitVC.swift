//

import UIKit

class RootSplitVC: UISplitViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let viewController = SideBarListViewController()

    primaryBackgroundStyle = .sidebar
    preferredDisplayMode = .oneBesideSecondary

    let listNavigationVC = UINavigationController(rootViewController: viewController)

    viewControllers = [
      listNavigationVC,
      DetailViewController(),
    ]
  }
}
