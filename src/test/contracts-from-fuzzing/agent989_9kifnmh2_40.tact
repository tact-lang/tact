struct Sub {
  x: Int;
  y: Bool;
}

contract Mismatch {
  a: Int;
  b: Sub;

  init() {
    self.a = 1;
    self.b = Sub{ x:7, y:true };
  }
}