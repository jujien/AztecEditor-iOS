import Foundation
import Aztec
import Gridicons

class TextViewStubAttachmentDelegate: TextViewAttachmentDelegate {

    func textView(_ textView: TextView, attachment: NSTextAttachment, imageAt url: URL, onSuccess success: @escaping (UIImage) -> Void, onFailure failure: @escaping (Void) -> Void) -> UIImage {
        return placeholderImage(for: attachment)
    }

    func textView(_ textView: TextView, placeholderForAttachment attachment: NSTextAttachment) -> UIImage {
        return placeholderImage(for: attachment)
    }

    func placeholderImage(for attachment: NSTextAttachment) -> UIImage {
        let imageSize = CGSize(width:32, height:32)
        let placeholderImage: UIImage
        switch attachment {
        case _ as ImageAttachment:
            placeholderImage = Gridicon.iconOfType(.image, withSize: imageSize)
        case _ as VideoAttachment:
            placeholderImage = Gridicon.iconOfType(.video, withSize: imageSize)
        default:
            placeholderImage = Gridicon.iconOfType(.attachment, withSize: imageSize)

        }

        return placeholderImage
    }

    func textView(_ textView: TextView, urlFor imageAttachment: ImageAttachment) -> URL {
        return URL(string: "placeholder://")!
    }

    func textView(_ textView: TextView, deletedAttachmentWith attachmentID: String) {

    }

    func textView(_ textView: TextView, selected attachment: NSTextAttachment, atPosition position: CGPoint) {
    }
    
    func textView(_ textView: TextView, deselected attachment: NSTextAttachment, atPosition position: CGPoint) {        
    }
}