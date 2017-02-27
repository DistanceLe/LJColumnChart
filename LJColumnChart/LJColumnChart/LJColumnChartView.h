//
//  LJColumnChartView.h
//  LJColumnChart
//
//  Created by LiJie on 2017/2/27.
//  Copyright © 2017年 LiJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJColumnChartView : UIView

/**  每跳柱形图的值 */
@property(nonatomic, strong)NSArray* valueArray;

/**  y轴的最大值， 可以不填，自动算出。 */
@property(nonatomic, assign)NSInteger yAxisMax;

/**  X轴的文字 */
@property(nonatomic, strong)NSArray* XAxisTextsArray;

/**  每条柱形图的宽度，可以不设置，直接设置 columnWidth*/
@property(nonatomic, strong)NSArray* columnWidthsArray;

/**  每条柱形图的颜色，可以不设置，直接设置 columnColor*/
@property(nonatomic, strong)NSArray* columnColorsArray;



/**  每条柱形图的 间隙， 默认5 */
@property(nonatomic, assign)CGFloat columnSpace;

/**  每条柱形图的宽度 默认23*/
@property(nonatomic, assign)CGFloat columnWidth;

/**  每条柱形图的颜色 默认白色*/
@property(nonatomic, strong)UIColor* columnColor;

/**  每条柱形图被选中后的颜色 默认灰色 */
@property(nonatomic, strong)UIColor* columnSelectColor;

/**  Y轴虚线的 颜色 默认浅白色*/
@property(nonatomic, strong)UIColor* yAxisdashColor;
/**  X Y轴 及其文字的颜色 默认都是白色*/
@property(nonatomic, strong)UIColor* XAndY_TextColor;
@property(nonatomic, strong)UIColor* XAndY_LineColor;

/**  X轴单位 ： 10分钟 */
@property(nonatomic, copy)NSString* XUnit;
/**  Y轴单位 */
@property(nonatomic, copy)NSString* YUnit;


/**  显示的时候 是否有动画  默认有 */
@property(nonatomic, assign)BOOL animation;

/**  添加数据的时候，直接移到最末尾 */
@property(nonatomic, assign)BOOL scrollToEnd;

/**  是否显示 Y轴值的虚线 默认不显示*/
@property(nonatomic, assign)BOOL showYAxisDash;

/**  是否显示 每条柱形图顶部的值 默认不显示*/
@property(nonatomic, assign)BOOL showEndValue;

/**  是否显示XY轴的线， 默认显示 */
@property(nonatomic, assign)BOOL showXAxisLine;
@property(nonatomic, assign)BOOL showYAxisLine;

/**  是否可点击，显示详细值 , 默认打开*/
@property(nonatomic, assign)BOOL canShowDetail;

/**  显示详细值的背景图片 */
@property(nonatomic, strong)UIImage* detailBackImage;




/**  添加数据, 后面相应的 宽度和颜色 可选， 默认移动到最后面 再添加 */
-(void)addData:(NSArray* )addDataArray titleArray:(NSArray*)titleArray widthArray:(NSArray*)widthArray colorArray:(NSArray*)colorArray animation:(BOOL)animation;

/**  开始显示 图表 */
-(void)showChart;




@end
