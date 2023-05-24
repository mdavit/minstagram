//
//  StorageManager.swift
//  Minstagram
//
//  Created by Davit Margaryan on 28.03.23.
//

import FirebaseStorage
public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDowload
    }
    
    // MARK: - Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDowload))
                return
            }
            
            completion(.success(url))
        })
    }
 
}

//public enum UserPostType {
//    case photo
//    case video
//}
//
///// Represents
//public struct UserPost {
//    let postType: UserPostType
//    let thumbnailImage: URL
//    let postURL: URL // either video url or full resolution photo
//    let caption: String?
//    let likeCount: [PostLikes]
//    let comments: [PostComment]
//    let createDate: Date
//    let taggedUsers: [User]
//    
//}
//
//struct PostLikes {
//    let username: String
//    let postIdentifier: String
//}
//
//struct CommentLikes {
//    let username: String
//    let commentIdentifier: String
//}
//
//
//struct PostComment {
//    let username: String
//    let text: String
//    let createDate: Date
//    let likes: CommentLikes
//}
