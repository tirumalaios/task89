//
//  GraphTableViewCell.swift
//  task
//
//  Created by Mac on 16/11/23.
//

import UIKit

class CurvedGraphView: UIView {
    
    var dataPoints: [CGFloat] = [0.9565, 0.136, 0.438, 0.2, 0.233, 0.535, 0.299, 0.833, 0.338, 0.42, 0.49, 0.523, 0.652, 0.688, 0.7332, 0.812, 0.9565] // Sample data points
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        drawCurve(with: context)
    }
    
    func drawCurve(with context: CGContext) {
        guard dataPoints.count > 1 else { return }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.height))
        
        let stepX = bounds.width / CGFloat(dataPoints.count - 1)
        
        for (index, dataPoint) in dataPoints.enumerated() {
            let x = stepX * CGFloat(index)
            let y = bounds.height * (1 - dataPoint)
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.close()
        
        UIColor.green.setFill() // Set your desired curve color
        path.fill()
    }
}

class GraphTableViewCell: UITableViewCell {

    @IBOutlet weak var curvedGraphView: CurvedGraphView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
