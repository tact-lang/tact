struct Outer {
  inner1: Inner;
  inner2: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract SameStructTwice {
  data: Outer = Outer { inner1: Inner{ x:1, y:true }, inner2: Inner{ x:2, y:false } };
  init() {
    self.data = Outer { inner1: Inner{ x:10, y:false }, inner2: Inner{ x:20, y:true } };
  }
  receive() {}
}