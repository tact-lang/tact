struct X {
  a: Int;
  b: Bool;
}

contract RepeatStructs {
  f1: X;
  f2: X;
  opt: Int?;

  init() {
    self.f1 = X{a:1,b:true};
    self.f2 = X{a:2,b:false};
    self.opt = null;
  }
}