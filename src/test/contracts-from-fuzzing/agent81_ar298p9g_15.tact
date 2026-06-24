struct ManyOpts {
  x: Int?;
  y: Bool?;
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
}

contract TestContract {
  m: ManyOpts;

  init() {
    self.m = ManyOpts{ x:null, y:null, a:null, b:true, c:null, d:false };
  }
}