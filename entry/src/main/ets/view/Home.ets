
class  MenuItemData{
  title:string;
  img?:Resource;
  other?:Resource;

  constructor(title:string,img?:Resource,other?:Resource){
    this.title= title
    this.img =img
    this.other = other
  }
}

@Component
export default struct Home {
  @State imgList:Array<Resource>=[
    $r('app.media.fig1'),
    $r('app.media.fig2'),
    $r('app.media.fig3'),
    $r('app.media.fig4'),
  ]

  @State firstGridData:Array<MenuItemData>= [
    new MenuItemData('我的最爱',$r('app.media.icon')),
    new MenuItemData('历史记录',$r('app.media.icon')),
    new MenuItemData('消息',$r('app.media.icon')),
    new MenuItemData('购物车',$r('app.media.icon')),
    new MenuItemData('我的目标',$r('app.media.icon')),
    new MenuItemData('圈子',$r('app.media.icon')),
    new MenuItemData('收藏',$r('app.media.icon')),
    new MenuItemData('回收站',$r('app.media.icon')),
    new MenuItemData('圈子',$r('app.media.icon')),
    new MenuItemData('收藏',$r('app.media.icon')),
    new MenuItemData('回收站',$r('app.media.icon')),
    new MenuItemData('圈子',$r('app.media.icon')),
    new MenuItemData('收藏',$r('app.media.icon')),
    new MenuItemData('回收站',$r('app.media.icon')),
  ]
  private swiperController:SwiperController = new SwiperController()

  build(){
    Scroll(){
      Column(){
        Text('this is home page')

        Swiper(this.swiperController){
          ForEach(this.imgList,(item:Resource,index:number)=>{
            Image(item)
              .borderRadius(10)
              .objectFit(ImageFit.Contain)
          },(item:Resource)=>JSON.stringify(item.id))
        }
        .height(240)
        .autoPlay(true)


        Grid(){
          ForEach(this.firstGridData,(item:MenuItemData,index:number)=>{
            GridItem(){
              Column(){
                Image(item.img)
                  .width(40)
                  .height(40)
                  .margin({bottom:10})
                Text(item.title)
              }
            }
          },(item:MenuItemData)=> JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap(12)
        .columnsGap(8)
        .height(180)
        .borderRadius(10)
        .backgroundColor('#fff')
        .padding(20)



      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .padding(20)
    }
    .height('100%')


  }
}