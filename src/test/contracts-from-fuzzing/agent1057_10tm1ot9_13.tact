struct LongFields {
  f1:Int; f2:Bool; f3:String?; f4:Int?; f5:Bool?; f6:String;
  f7:Int; f8:Bool; f9:String?; f10:Int?; f11:Bool?; f12:String;
  f13:Int; f14:Bool; f15:String?; f16:Int?; f17:Bool?; f18:String;
}

contract LongFieldList {
  vars: LongFields;

  init(){
    self.vars = LongFields{
      f1:1,f2:true,f3:null,f4:2,f5:null,f6:"a",
      f7:3,f8:false,f9:"x",f10:null,f11:true,f12:"b",
      f13:7,f14:true,f15:null,f16:5,f17:false,f18:"c"
    };
  }
}