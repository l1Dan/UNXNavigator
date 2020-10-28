//
//  TableViewSection.m
//  UINavigationExtensionDemo
//
//  Created by lidan on 2020/10/25.
//

#import "TableViewSection.h"

@implementation TableViewSectionItem

- (instancetype)initWithTitle:(NSString *)title itemType:(TableViewSectionItemType)itemType {
    if (self = [super init]) {
        _title = title;
        _itemType = itemType;
        _disclosureIndicator = YES;
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title itemType:(TableViewSectionItemType)itemType {
    return [[self alloc] initWithTitle:title itemType:itemType];
}

@end

@implementation TableViewSection

- (instancetype)initWithItems:(NSArray<TableViewSectionItem *> *)items {
    if (self = [super init]) {
        _items = items;
    }
    return self;
}

+ (instancetype)sectionWithItems:(NSArray<TableViewSectionItem *> *)items {
    return [[self alloc] initWithItems:items];
}

+ (NSArray<TableViewSection *> *)makeAllSections {
    NSMutableArray *items1 = [NSMutableArray arrayWithObjects:
                              [TableViewSectionItem itemWithTitle:@"导航栏背景色" itemType:TableViewSectionItemTypeNavigationBarBackgroundColor],
                              [TableViewSectionItem itemWithTitle:@"导航栏背景图片" itemType:TableViewSectionItemTypeNavigationBarBackgroundImage],
                              [TableViewSectionItem itemWithTitle:@"导航栏透明" itemType:TableViewSectionItemTypeNavigationBarTransparent],
                              [TableViewSectionItem itemWithTitle:@"导航栏半透明" itemType:TableViewSectionItemTypeNavigationBarTranslucent],
                              [TableViewSectionItem itemWithTitle:@"导航栏底部线条颜色" itemType:TableViewSectionItemTypeNavigationBarShadowColor],
                              [TableViewSectionItem itemWithTitle:@"导航栏底部线条图片" itemType:TableViewSectionItemTypeNavigationBarShadowImage],
                              [TableViewSectionItem itemWithTitle:@"自定义返回按钮图片" itemType:TableViewSectionItemTypeNavigationBarCustomBackButtonImage],
                              [TableViewSectionItem itemWithTitle:@"自定义返回按钮" itemType:TableViewSectionItemTypeNavigationBarCustomBackButton],
                              [TableViewSectionItem itemWithTitle:@"模态窗口" itemType:TableViewSectionItemTypeNavigationBarModal],
                              [TableViewSectionItem itemWithTitle:@"全屏背景色" itemType:TableViewSectionItemTypeNavigationBarFullScreen],
                              [TableViewSectionItem itemWithTitle:@"ScrollView(self.view) with UENavigationBar" itemType:TableViewSectionItemTypeNavigationBarScrollView],
                              [TableViewSectionItem itemWithTitle:@"ScrollView(self.view) 全屏背景色" itemType:TableViewSectionItemTypeNavigationBarScrollViewWithFullScreen],
                              nil];
    TableViewSection *section1 = [TableViewSection sectionWithItems:items1];
    section1.title = @"基础功能";
    
    NSMutableArray *items2 = [NSMutableArray arrayWithObjects:
                              [TableViewSectionItem itemWithTitle:@"禁用手势滑动" itemType:TableViewSectionItemTypeNavigationBarDisablePopGesture],
                              [TableViewSectionItem itemWithTitle:@"使用全屏滑动手势" itemType:TableViewSectionItemTypeNavigationBarFullPopGesture],
                              [TableViewSectionItem itemWithTitle:@"导航栏返回事件拦截" itemType:TableViewSectionItemTypeNavigationBarBackEventIntercept],
                              [TableViewSectionItem itemWithTitle:@"自定义跳转到目标控制器" itemType:TableViewSectionItemTypeNavigationBarJumpToViewController],
                              [TableViewSectionItem itemWithTitle:@"完全自定义导航栏" itemType:TableViewSectionItemTypeNavigationBarCustom],
                              [TableViewSectionItem itemWithTitle:@"导航栏点击事件穿透到底部试图" itemType:TableViewSectionItemTypeNavigationBarClickEventHitToBack],
                              [TableViewSectionItem itemWithTitle:@"滑动改变导航栏背景" itemType:TableViewSectionItemTypeNavigationBarScrollChangeNavigationBar],
                              [TableViewSectionItem itemWithTitle:@"使用 WebView 结合 UENavigationBar" itemType:TableViewSectionItemTypeNavigationBarWebView],
                              nil];
    TableViewSection *section2 = [TableViewSection sectionWithItems:items2];
    section2.title = @"高级功能";

    return [NSMutableArray arrayWithObjects:section1, section2, nil];
}

@end