//
//  ListViewController.m
//  CloudTest
//
//  Created by Hasan Ibna Akbar on 3/22/15.
//  Copyright (c) 2015 Hasan Ibna Akbar. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewCell.h"

@interface ListViewController () <UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (strong, nonatomic) NSArray *listData;

@end

@implementation ListViewController

#pragma mark - View Life-cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listData = [self getListData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (NSArray *)getListData {

    return @[@"hhh.png", @"hello.png"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedUploadButton:(id)sender {
    
    // To support only of choosing photo from library
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellString = @"ListViewCell";
    ListViewCell *cell = (ListViewCell *)[tableView dequeueReusableCellWithIdentifier:cellString];
    
    cell.itemName.text = self.listData[indexPath.row];
    
    return cell;
}

#pragma mark - UIImagePickerControllerDelegate
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;
    
//    // Handle a still image picked from a photo album
//    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
//        == kCFCompareEqualTo) {
//        
//        editedImage = (UIImage *) [info objectForKey:
//                                   UIImagePickerControllerEditedImage];
//        originalImage = (UIImage *) [info objectForKey:
//                                     UIImagePickerControllerOriginalImage];
//        
//        if (editedImage) {
//            imageToUse = editedImage;
//        } else {
//            imageToUse = originalImage;
//        }
//        
//        //self.userPicImageView.image = imageToUse;
//        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//        [parameters setObject:_currentUser.token forKey:@"token"];
//        [parameters setObject:_currentUser.id forKey:@"user"];
//        
//#if DEBUG_PROFILE_IMAGE_SIZE
//        NSLog(@"Length : %lu", (unsigned long)UIImageJPEGRepresentation(imageToUse, 0.2).length);
//#endif
//        
//        [[NetworkManager instance] uploadImage:UIImageJPEGRepresentation(imageToUse, 0.2)
//                                   withBaseURL:[FutureWorld baseAPI]
//                                          path:[FutureWorld profilePicPathRelativeToBaseWithParams:parameters].absoluteString
//                                    parameters:nil
//                                    completion:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject)
//         {
//             if ([[responseObject objectForKey:@"success"] boolValue] == YES) {
//                 _currentUser.image_url = [responseObject objectForKey:@"image_url"];
//                 [_currentUser setCurrentUser];
//                 
//                 __block MyZoneViewController *_lself = self;
//                 
//                 [self.userPicImageView setImageWithURL:[FutureWorld imageAPI:_currentUser.image_url]
//                                       placeholderImage:nil
//                                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                                  if (error) {
//                                                      NSLog(@"ERROR (Image load) : %@", error);
//                                                      
//                                                      
//                                                      [NSThread HA_performBlockOnMainThread:^{
//                                                          _lself.userPicImageView.image = [UIImage imageNamed:@"AddUser"];
//                                                      }];
//                                                  }
//                                                  else {
//                                                      
//#if DEBUG_PROFILE_IMAGE_SIZE
//                                                      NSLog(@"Profile Image Size : %f %f", image.size.width, image.size.height);
//#endif
//                                                  }
//                                              }
//                            usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//             }
//         }
//                                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
//         {
//             NSLog(@"Error %@", error);
//         }];
//    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
