//
//  ProfileController.swift
//  MyInstagram
//
//  Created by Sidany Walker on 2/24/22.
//

import UIKit

class ProfileController: UICollectionViewController {
    
    private let cellIdentifier = "ProfileCell"
    private let headerIdentifier = "ProfileHeader"
    
    // MARK: - Properties
    
    private var user: User
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) had not been implemented")
    }
    
    // dependency injection - this profilecontroller requires a user to populate everything it has (header, posts) it would make sense to initialize the controller with a user object so anytime we want to instantiate this profilecontroller, it's going to require that we pass in a user for it, that way once it loads, it will already have this user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    // MARK: - API
    
    
    // MARK: - Helpers
    
    func configureCollectionView(){
        navigationItem.title = user.username
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
}
    
    // MARK: - UICollectionViewDataSource
    
    extension ProfileController {
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 9
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
            return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                        
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeader
            
            header.viewModel = ProfileHeaderViewModel(user: user)
            
            return header
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    extension ProfileController {
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    extension ProfileController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        // spacing of cells from each other for example when you upload multiple pictures you have a space of '1' from each picture left to right and top to bottom
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width - 2) / 3
            return CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.width, height: 240)
        }
}
