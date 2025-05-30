struct Rec1 {
  val: Int;
  opt: Int?;
}

struct Rec2 {
  r: Rec1;
  flag: Bool;
}

contract RecContract {
  f: Rec2;
  init() {
    self.f = Rec2{
      r: Rec1{ val:2, opt:null },
      flag: true
    };
  }
}