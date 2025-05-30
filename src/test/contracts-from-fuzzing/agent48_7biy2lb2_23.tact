struct S {
  a: Int;   
  b: Int?;  
  c: Int;   
}

contract TestContract {
  s: S;
  x: Int?;

  init() {
    self.s = S{ a: 1, b: null, c: 3 };
    self.x = 4;
  }
}