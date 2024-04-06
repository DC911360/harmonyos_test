@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentIndex:number = 0;
  private constroller:TabsController = new TabsController();

  @Builder TabsBuilder(title:string,index:number ,selectImg:Resource, normalImg:Resource){
    Column(){
      Image(this.currentIndex == index? selectImg : normalImg)
        .width(45)
        .height(45)

      Text(title)
        .fontSize(20)
        .fontColor(this.currentIndex == index?Color.Blue:Color.Black)
    }
  }

  build() {
    Tabs({
      barPosition:BarPosition.End,index:0,controller:this.constroller
    }){
      TabContent(){
        Text('home')
      }
      .tabBar(this.TabsBuilder('home',0,$r('app.media.home_selected'),$r('app.media.home_normal')))
      .backgroundColor("#eee")

      TabContent(){
        Text('my')
      }
      .tabBar(this.TabsBuilder('my',1,$r('app.media.mine_selected'),$r('app.media.mine_normal')))
      .backgroundColor("#eee")
    }
    .vertical(false)
    .backgroundColor('#fff')
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .barHeight(100)
    .animationDuration(400)
    .onChange((index:number)=>{
      this.currentIndex = index
    })
  }
}