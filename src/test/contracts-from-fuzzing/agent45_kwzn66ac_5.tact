struct Inner {
  f1: Int;
  f2: Bool;
}

contract ListOfStructs {
  i1: Inner;
  i2: Inner;
  i3: Inner;

  init() {
    self.i1 = Inner{f1:1, f2:true};
    self.i2 = Inner{f1:2, f2:false};
    self.i3 = Inner{f1:3, f2:true};
  }
}