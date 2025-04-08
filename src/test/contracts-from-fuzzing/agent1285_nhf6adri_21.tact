// Wide struct with 30 fields
struct S {
  f1: Int; f2: Bool; f3: String; f4: Int?; f5: String?;
  f6: Bool?; f7: Address; f8: Cell; f9: Slice; f10: Int as uint8;
  f11: Int; f12: Bool; f13: String; f14: Int?; f15: String?;
  f16: Bool?; f17: Address; f18: Cell; f19: Slice; f20: Int as uint8;
  f21: Int; f22: Bool; f23: String; f24: Int?; f25: String?;
  f26: Bool?; f27: Address; f28: Cell; f29: Slice; f30: Int as uint8;
}

contract TestContract {
  s: S;
  init() {
    self.s = S{
      f1:1,f2:true,f3:"x",f4:null,f5:null,
      f6:null,f7:myAddress(),f8:emptyCell(),f9:emptyCell().asSlice(),f10:0,
      f11:2,f12:false,f13:"y",f14:null,f15:null,
      f16:null,f17:myAddress(),f18:emptyCell(),f19:emptyCell().asSlice(),f20:1,
      f21:3,f22:true,f23:"z",f24:null,f25:null,
      f26:null,f27:myAddress(),f28:emptyCell(),f29:emptyCell().asSlice(),f30:2
    };
  }
}