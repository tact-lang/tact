struct S {
  x: Int;
  y: Int;
  z: Int;
  t: Int;
}

contract ManyFields {
  f1: S;
  f2: S;
  f3: S;
  f4: S;
  f5: S;

  init() {
    self.f1 = S{ x:1, y:2, z:3, t:4 };
    self.f2 = S{ x:5, y:6, z:7, t:8 };
    self.f3 = S{ x:9, y:10, z:11, t:12 };
    self.f4 = S{ x:13, y:14, z:15, t:16 };
    self.f5 = S{ x:17, y:18, z:19, t:20 };
  }
}