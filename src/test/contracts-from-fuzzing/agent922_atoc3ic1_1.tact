struct Inner {
  x: Int;
  y: Int?;
  z: Bool;
}

contract TestContract {
  p: Inner;
  q: Inner;
  r: Bool;

  init() {
    self.p = Inner{ x:1, y:2, z:true };
    self.q = Inner{ x:3, y:null, z:false };
    self.r = true;
  }
}