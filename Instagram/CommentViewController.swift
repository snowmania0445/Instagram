//
//  CommentViewController.swift
//  Instagram
//
//  Created by 春原卓也 on 2018/04/19.
//  Copyright © 2018年 takuya.sunohara. All rights reserved.
//

import Firebase
import FirebaseDatabase
import SVProgressHUD
import UIKit

class CommentViewController: UIViewController {
    
    var postData: PostData!
    
    @IBOutlet weak var commentField: UITextField!
    @IBAction func handleCommentButton(_ sender: Any) {
        let commentText = commentField.text!
        if commentText.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
        }
        //Firebaseに保存する情報
        let name = Auth.auth().currentUser?.displayName
        let comment = commentText
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let caption = ["caption":postData.caption! + "\n\(name!)さんのコメント : \(comment)"]
        postRef.updateChildValues(caption)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
