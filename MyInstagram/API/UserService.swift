//
//  UserService.swift
//  MyInstagram
//
//  Created by Sidany Walker on 2/26/22.
//

import Firebase

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        COLLECTION_USERS.getDocuments { (snapshot, error) in
        guard let snapshot = snapshot else { return }
        
        let users = snapshot.documents.map({ User(dictionary: $0.data()) })
        completion(users)
    
    // mapping function takes one data object and performs some sort of mapping and convert it to another data object. Looking at the documents array on the snapshot and all we need from that documents array is the document data from each particular document. Map the documents array to an array of users. $0.data represents each one of the documents in that doc array basically shorthanding a for-loop code
        }
    }
}
