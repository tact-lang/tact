struct BigMix {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
}

contract TestContract {
  m: BigMix;

  init() {
    self.m = BigMix{
      a:1, b:true, c:null, d:null, e:5, f:false, g:null, h:true
    };
  }
}