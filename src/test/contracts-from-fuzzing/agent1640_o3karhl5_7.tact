struct Sub {
  aa: Int;
  bb: Bool;
}

contract ArrayLike {
  s1: Sub;
  s2: Sub;
  s3: Sub;

  init() {
    self.s1 = Sub{aa: 1, bb: true};
    self.s2 = Sub{aa: 2, bb: false};
    self.s3 = Sub{aa: 3, bb: true};
  }
}