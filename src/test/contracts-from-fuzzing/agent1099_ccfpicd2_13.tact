struct X {
  a: Int;
  b: Bool;
}

contract ManyStructs {
  s1: X;
  s2: X;
  s3: X;

  init() {
    self.s1 = X{a:1, b:true};
    self.s2 = X{a:2, b:false};
    self.s3 = X{a:3, b:true};
  }
}