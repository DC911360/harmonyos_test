

class ItemData{
  title:string;
  img?:Resource;
  others?:string;

  constructor( title:string,img?:Resource,others?:string) {
    this.title = title
    this.img = img
    this.others = others
  }

}




@Component
export default struct My {
  @State List:ItemData[]=[
  new ItemData('推送通知',$r('app.media.message'),'toggle'),
  new ItemData('数据管理',$r('app.media.message'),null),
  new ItemData('菜单设置',$r('app.media.message'),null),
  new ItemData('关于',$r('app.media.message'),null),
  new ItemData('清楚缓存',$r('app.media.message'),null),
  new ItemData('隐私协议',$r('app.media.message'),null),
]
  build(){
    Scroll(){
      Column(){
        Text('this is My page')

        Row(){
          Image($r('app.media.icon'))
            .width(70)
            .height(70)
            .borderRadius('100%')
          Column(){
            Text('DC')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
            Text('15910609156@163.com')
              .fontSize(15)
          }
          .margin({left:20})
          .alignItems(HorizontalAlign.Start)
        }
        .padding(20)
        .backgroundColor("#fff")
        .width('100%')
        .borderRadius(10)
        .margin({top:20,bottom:20})


        List(){
          ForEach(this.List,(item:ItemData,index:number)=>{
            ListItem(){
              // SettingCell({items:item})
            Row(){
              Row(){
                  Image(item.img)
                    .width(30)

                    .height(30)
                  Text(item.title)
                    .margin({
                      left:10
                    })
              }
              if(item.others == null){
                Image($r('app.media.arrow'))
                  .width(20)
              }else{
                Toggle({type:ToggleType.Switch,isOn:true})
              }
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .width('100%')
            .backgroundColor("#fff")
            .padding(10)
            .borderRadius(10)
            .margin({bottom:10})

            }
          },(item:ItemData)=>item.title)
        }





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


// @Component
// struct SettingCell{
//   @Prop items:ItemData
//   build(){
//     Row(){
//       Row(){
//         Image(this.items.img)
//           .width(30)
//           .height(30)
//         Text(this.items.title)
//           .margin({
//             left:10
//           })
//       }
//
//       if(this.items.others == null){
//         Image($r('app.media.arrow'))
//           .width(20)
//       }else{
//         Toggle({type:ToggleType.Switch,isOn:true})
//       }
//
//
//     }
//     .justifyContent(FlexAlign.SpaceBetween)
//     .width('100%')
//     .backgroundColor("#fff")
//     .padding(10)
//     .borderRadius(10)
//     .margin({bottom:10})
//
//   }
// }