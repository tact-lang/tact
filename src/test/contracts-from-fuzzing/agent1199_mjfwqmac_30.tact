struct Complex {
  a: Int;
  b: String;
  c: Bool;
  d: Inner;
  e: Inner?;
}

struct Inner {
  x: Int;
  y: String;
}

contract Test30 {
  s: Complex;

  init() {
    self.s = Complex{
      a:1,
      b:"b",
      c:true,
      d:Inner{x:2, y:"y"},
      e:null
    };
  }
}