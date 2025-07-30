struct S { x: Int }

contract ManyVariables {
  x1: Int = 0;
  x2: Int = 0;
  x3: Int = 0;
  x4: Int = 0;
  x5: Int = 0;
  x6: Int = 0;
  s1: S;
  s2: S;
  s3: S;

  init() {
    self.x1=1; self.x2=2; self.x3=3; self.x4=4; self.x5=5; self.x6=6;
    self.s1 = S{ x: 10 };
    self.s2 = S{ x: 20 };
    self.s3 = S{ x: 30 };
  }
}
