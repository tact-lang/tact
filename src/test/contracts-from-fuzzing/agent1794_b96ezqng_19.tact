struct Inner {
  x: Int;
  y: Bool;
}

contract ArrayLike {
  s1: Inner;
  s2: Inner;
  s3: Inner;

  init() {
    self.s1 = Inner{x:1,y:true};
    self.s2 = Inner{x:2,y:false};
    self.s3 = Inner{x:3,y:true};
  }
}
