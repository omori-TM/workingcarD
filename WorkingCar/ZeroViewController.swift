//
//  ZeroViewController.swift
//  WorkingCar
//
//  Created by 森尻尭之 on 2016/06/28.
//  Copyright © 2016年 Takayuki Morijiri. All rights reserved.
//

import UIKit

class ZeroViewController: UIViewController {

    //@IBOutlet weak var myImageView: UIImageView!
    
    var myImageView: UIImageView!
    var timer:NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initImageView()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        let btn_back = UIBarButtonItem()
        btn_back.title = ""
        self.navigationItem.backBarButtonItem = btn_back
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0,target: self,selector: "gotoView",userInfo: nil,repeats: false)
        
        
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, 300, 50))
        label.font = UIFont.systemFontOfSize(30)
        label.text = "はたらくるま"
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.blackColor()
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        label.textAlignment = NSTextAlignment.Center
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        self.view.addSubview(label)
        
        
//        let btn: UIButton = UIButton()
//        btn.frame = CGRectMake(0, 0, 200, 50)
//        btn.layer.position = CGPoint(x: self.view.frame.size.width/2,y: 500)
//        btn.backgroundColor = UIColor.orangeColor()
//        btn.setTitle("ひらく", forState: .Normal)
//        btn.addTarget(self, action: "gotoView:", forControlEvents: .TouchUpInside)
//        self.view.addSubview(btn)
        
    }
    
    func gotoView(){
        
        let viewController: ViewController = ViewController()
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    func initImageView(){
        myImageView = UIImageView(frame: CGRectMake(0,0,view.frame.size.width,view.frame.size.height))
        
        // UIImage インスタンスの生成
        var image1:UIImage? = UIImage(named:"素材.png")
        
        // UIImageView 初期化
        let imageView = UIImageView(image:image1)
        
        // 画像の中心を設定
        imageView.center = CGPointMake(187.5, 333.5)
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
        UIView.transitionWithView(imageView, duration: 30, options: .CurveLinear, animations: { () -> Void in
            
            // 画面右まで移動
            imageView.frame.origin.x = self.view.bounds.width
            
            }, completion: { _ in
                
                // 画面右まで行ったら、画面左に戻す
                imageView.frame.origin.x = -imageView.bounds.size.width
                
                // 再度アニメーションを起動
                self.animatedImage(imageView)
        })
        
    }
    
    func animatedImage(target:UIView?){

        UIView.transitionWithView(target!, duration: 30, options: .CurveLinear, animations: { () -> Void in
            target!.frame.origin.x = self.view.bounds.width},
            completion: { _ in
                target!.frame.origin.x = -target!.bounds.size.width
                self.animatedImage(target)
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        animatedImage(self.myImageView)
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
