struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract MulVars {
  x: S;
  y: S;
  init() {
    self.x = S{ a:1, b:true, c:"a" };
    self.y = S{ a:2, b:false, c:"b" };
  }
}