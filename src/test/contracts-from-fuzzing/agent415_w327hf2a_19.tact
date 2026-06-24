struct BigStruct {
  f1:Int; f2:Bool; f3:String; f4:Int?; f5:Bool?;
  f6:Int; f7:Bool; f8:String; f9:Int?; f10:Bool?;
  f11:Int; f12:Bool; f13:String; f14:Int?; f15:Bool?;
  f16:Int; f17:Bool; f18:String; f19:Int?; f20:Bool?;
  f21:Int; f22:Bool; f23:String; f24:Int?; f25:Bool?;
  f26:Int; f27:Bool; f28:String; f29:Int?; f30:Bool?;
}

contract BigStructField {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      f1:1, f2:true, f3:"a", f4:null, f5:null,
      f6:2, f7:true, f8:"b", f9:null, f10:null,
      f11:3, f12:false, f13:"c", f14:null, f15:null,
      f16:4, f17:true, f18:"d", f19:null, f20:null,
      f21:5, f22:false, f23:"e", f24:null, f25:null,
      f26:6, f27:true, f28:"f", f29:null, f30:null,
    };
  }
}