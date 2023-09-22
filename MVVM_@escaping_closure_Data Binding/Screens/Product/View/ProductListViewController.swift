//
//  ProductListViewController.swift
//  MVVM_@escaping_closure_Data Binding
//
//  Created by Atik  on 19/9/23.
//

import UIKit

class ProductListViewController: UIViewController {

    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
    }

}

extension ProductListViewController {
    
    func configuration() {
        
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // Observe Data Binding event - Communication
    func observeEvent() {
        
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else { return }
            
            switch event {
                case .loading:
                    break
                case .stopLoading:
                    break
                case .dataLoaded:
                    print(self.viewModel.products)
                case .error(let error):
                    print(error)
            }
        }
    }
}
