//
//  ViewController.swift
//  Get_JSON
//
//  Created by Anton on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let myQueue = DispatchQueue.main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=1")

  
     
    
      func getPost()  {
        
        guard let requestUrl = url else {return}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data,
                    
                    let dataString = String(data: data, encoding: .utf8),
                    
                    (response as? HTTPURLResponse)?.statusCode == 200,
                    
                    error == nil else { return }
         
            DispatchQueue.main.async {
                self.textView.text = dataString
            }
           
           
        }
          
            task.resume()
        
    }
    
    @IBAction func getBtn(_ sender: Any) {
        getPost()
    }
    
    
    
}

