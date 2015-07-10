//

#import <UIKit/UIKit.h>
#import "FaceppAPI.h"

#import "MBProgressHUD.h"

@interface DoubleChoseViewController : UIViewController {
    IBOutlet UIImageView *imageView;
    
    UIImagePickerController *imagePicker;
}


-(IBAction)pickFromCameraButtonPressed:(id)sender;
-(IBAction)pickFromLibraryButtonPressed:(id)sender;

-(void) detectWithImage: (UIImage*) image;
@end
