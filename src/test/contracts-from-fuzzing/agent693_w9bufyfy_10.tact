struct ManyOpt {
  f1:Int?; f2:Bool?; f3:String?; f4:Address?; f5:Cell?; f6:Slice?;
  f7:Int?; f8:Bool?; f9:String?; f10:Address?; f11:Cell?; f12:Slice?;
}

contract Test {
  mo: ManyOpt;

  init() {
    self.mo = ManyOpt{
      f1:null,f2:null,f3:null,f4:null,f5:null,f6:null,
      f7:null,f8:null,f9:null,f10:null,f11:null,f12:null
    };
  }

  receive() {
    self.mo = ManyOpt{
      f1:1, f2:true, f3:"x", f4:null, f5:emptyCell(), f6:emptyCell().asSlice(),
      f7:2, f8:false, f9:"y", f10:null, f11:emptyCell(), f12:emptyCell().asSlice()
    };
  }
}
