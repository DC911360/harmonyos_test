@Entry
@Component
struct Setting {
  @State message: string = 'Hello World'
  @State currentIndex:number = 0;
  private controller:TabsController = new TabsController();

  @Builder TabBuilder(title:string,index:number,selectImg:Resource,normalImg:Resource){
    Column(){
        Image(this.currentIndex == index ? selectImg: normalImg )
          .width(40)
          .height(40)
        Text(title)
          .margin({top:10})
          .fontSize(20)
          .fontColor(this.currentIndex == index ? Color.Blue: Color.Black)
    }
    .onClick( ()=>{
      this.currentIndex = index
      this.controller.changeIndex(this.currentIndex)
    } )
  }

  build() {
    Tabs({
      barPosition:BarPosition.End,
      controller:this.controller
    }){
      TabContent(){
        Text('first',)
      }
      .tabBar(this.TabBuilder('home',0,$r('app.media.home_selected'),$r('app.media.home_normal')))
      .backgroundColor('gray')


      TabContent(){
        Text('second')
      }
      .tabBar(this.TabBuilder('my',1,$r('app.media.mine_selected'),$r('app.media.mine_normal')))
      .backgroundColor('gray')
    }
    .vertical(false)
    .barHeight(100)
    .barMode(BarMode.Fixed)
    .width('100%')
    .backgroundColor('#fff')
    .onChange((index:number)=>{
      this.currentIndex = index
    })
  }
}