//
//  DatabaseManger.swift
//  Messenger
//
//  Created by Meme Mhd on 09/09/2020.
//  Copyright © 2020 meme. All rights reserved.
//

import Foundation
import FirebaseDatabase

    
final class DatabaseManger{
    static let shared = DatabaseManger()
    private let database = Database.database().reference()
    
}
//MARK: - Account management
 extension DatabaseManger {
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)){
        database.child(email).observeSingleEvent(of: .value, with:  { snapshot in
            guard snapshot.value as? String != nil else{
                completion(false)
                return
            }
            completion(true)
        })
    }
    
/// inserts the user into the database
    public func insertUser(with user: ChatAppUser){
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

 struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    //   let profilePictureUrl: String
}

