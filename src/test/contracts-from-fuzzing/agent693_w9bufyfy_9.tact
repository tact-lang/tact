struct Many {
  f1:Int; f2:Bool; f3:String; f4:Address; f5:Cell; f6:Slice;
  f7:Int; f8:Bool; f9:String; f10:Address; f11:Cell; f12:Slice;
  f13:Int; f14:Bool; f15:String; f16:Address; f17:Cell;
  f18:Slice; f19:Int; f20:Bool; f21:String;
}

contract Test {
  big: Many;

  init() {
    self.big = Many{
      f1:1,f2:true,f3:"a",f4:myAddress(),f5:emptyCell(),f6:emptyCell().asSlice(),
      f7:7,f8:false,f9:"b",f10:myAddress(),f11:emptyCell(),f12:emptyCell().asSlice(),
      f13:13,f14:true,f15:"c",f16:myAddress(),f17:emptyCell(),
      f18:emptyCell().asSlice(),f19:19,f20:false,f21:"d"
    };
  }

  receive() {
    self.big = self.big;
  }
}
