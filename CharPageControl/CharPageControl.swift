//  Copyright 2016 Nattawut Singhchai <jadedragon17650@gmail.com>
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import UIKit

@IBDesignable
public class CharPageControl: UILabel {
    
    var collctionViewDelegate: UICollectionViewDelegate?
    
    var currentAttributedString: NSMutableAttributedString?
    
    @IBInspectable
    public var pattern: String = "" {
        didSet{
            if pattern.characters.count == 0 {
                pattern = ""
            }
            preparePageControlString()
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var currentPage: CGFloat = 0.0 {
        didSet{
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var numberOfPages: CGFloat = 1.0 {
        didSet{
            preparePageControlString()
        }
    }
    
    @IBInspectable
    public var defaultColor: UIColor = UIColor(white: 0.85, alpha: 1) {
        didSet {
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var currentColor: UIColor = UIColor.blackColor() {
        didSet {
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var space: CGFloat = 1.5 {
        didSet {
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var lineSpace: CGFloat = 1.0 {
        didSet {
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var minimumLineHeight: CGFloat = 1.0 {
        didSet {
            updatePage(currentPage)
        }
    }
    
    @IBInspectable
    public var lineHeightMultiple: CGFloat = 1.0 {
        didSet {
            updatePage(currentPage)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 0
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberOfLines = 0
    }
    
    private func preparePageControlString () {
        var string = String()
        for i in 0..<Int(numberOfPages) {
            string.append(pattern[i % pattern.characters.count])
        }
        currentAttributedString = NSMutableAttributedString(string: string)
        resetAttributes()
    }
    
    
    private func updatePage(var progress: CGFloat) {
        
        progress = max(0.0,min(progress,numberOfPages-1))
        
        if currentAttributedString == nil {
            preparePageControlString()
        }else{
            resetAttributes()
        }
        
        if let currentAttributedString = currentAttributedString {
            
            currentAttributedString.setAttributes(attributeForProgress(progress - floor(progress)), range: NSMakeRange(Int(floor(progress)), 1))
            currentAttributedString.setAttributes(attributeForProgress(ceil(progress) - progress), range: NSMakeRange(Int(ceil(progress)), 1))
            
            attributedText = currentAttributedString
        }
    }
    
    public func size() -> CGSize? {
        return currentAttributedString?.size()
    }
    
    private func resetAttributes(){
        if let currentAttributedString = currentAttributedString {
            currentAttributedString.setAttributes(attributeForProgress(1),
                range: NSMakeRange(0, currentAttributedString.length))
        }
    }
    
    private func attributeForProgress(progress: CGFloat) -> [String:AnyObject] {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment =  textAlignment
        paragraph.lineSpacing = lineSpace
        paragraph.minimumLineHeight = minimumLineHeight
        paragraph.lineHeightMultiple = lineHeightMultiple
        
        return [NSFontAttributeName:font,
            NSForegroundColorAttributeName:currentColor.colorByInterpolatingToColor(defaultColor, progress: progress),
            NSKernAttributeName:space,
            NSParagraphStyleAttributeName:paragraph]
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        updatePage(currentPage)
    }
    
    public override func layoutSubviews() {
        updatePage(currentPage)
    }
    
    override public func prepareForInterfaceBuilder() {
        updatePage(currentPage)
    }
    
}

extension UIColor {
    
    func colorByInterpolatingToColor(color: UIColor, progress: CGFloat) -> UIColor {
        
        let progress = min(1.0, max(0, progress))
        
        var startRed: CGFloat = 0.0, startGreen: CGFloat = 0.0, startBlue: CGFloat = 0.0, startAlpha: CGFloat = 0.0
        var endRed: CGFloat = 0.0, endGreen: CGFloat = 0.0, endBlue: CGFloat = 0.0, endAlpha: CGFloat = 0.0
        
        getRed(&startRed, green: &startGreen, blue: &startBlue, alpha: &startAlpha)
        color.getRed(&endRed, green: &endGreen, blue: &endBlue, alpha: &endAlpha)
        
        return UIColor(
            red: startRed + (endRed - startRed) * progress,
            green: startGreen + (endGreen - startGreen) * progress,
            blue: startBlue + (endBlue - startBlue) * progress,
            alpha: startAlpha + (endAlpha - startAlpha) * progress)
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
}
