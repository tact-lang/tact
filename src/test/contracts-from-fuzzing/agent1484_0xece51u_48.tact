struct S1 {
  a: Int;
  b: Bool;
}

contract InitStructAsDefault {
  s: S1 = S1{a:5,b:true};

  init() {
    self.s = S1{a:15,b:false};
  }
}