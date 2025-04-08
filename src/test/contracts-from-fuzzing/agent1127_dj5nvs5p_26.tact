struct Outer {
  a: Int;
  b: Bool;
  s: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract UpdateNested {
  data: Outer;

  init() {
    self.data = Outer{ a:1, b:false, s:Inner{ x:5, y:true } };
  }

  receive() {
    self.data.s.x = 123;
    self.data.s.y = false;
  }
}
