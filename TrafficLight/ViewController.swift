//
//  ViewController.swift
//  TrafficLight
//
//  Created by Hung Vu on 04/11/2023.
//

import UIKit

enum LightColor {
    case red
    case yellow
    case green
    case none
}

class ViewController: UIViewController {
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer: Timer = Timer()
    var countDown = 0
    var light: LightColor = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLightColor(light: .none, time: 0)
    }
    
    func setupUI() {
        lightView.layer.cornerRadius = 50
        [redView, yellowView, greenView].forEach {
            $0?.layer.cornerRadius = 40
        }
        [redButton, yellowButton, greenButton].forEach {
            $0?.layer.cornerRadius = 4
        }
    }
    
    func setupLightColor(light: LightColor, time: Int) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        countDown = time
        switch light {
        case .red:
            redView.backgroundColor = .red
            [yellowView, greenView].forEach {
                $0?.backgroundColor = .systemGray5
            }
        case .yellow:
            yellowView.backgroundColor = .yellow
            [redView, greenView].forEach {
                $0?.backgroundColor = .systemGray5
            }
        case .green:
            greenView.backgroundColor = .green
            [yellowView, redView].forEach {
                $0?.backgroundColor = .systemGray5
            }
        case .none:
            [redView, yellowView, greenView].forEach {
                $0?.backgroundColor = .systemGray5
            }
        }
    }
    
    @objc func updateTimer() {
        timeLabel.text = String(countDown)
        countDown -= 1
        if countDown < 0 {
            timer.invalidate()
        }
    }

    @IBAction func tapToRedLight(_ sender: Any) {
        setupLightColor(light: .red, time: 8)
    }
    @IBAction func tapToYellowLight(_ sender: Any) {
        setupLightColor(light: .yellow, time: 3)
    }
    @IBAction func tapToGreenLight(_ sender: Any) {
        setupLightColor(light: .green, time: 5)
    }
}

