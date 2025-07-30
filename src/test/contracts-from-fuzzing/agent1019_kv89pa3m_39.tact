struct Base {
  x: Int;
  y: Bool;
}

struct Container {
  a: Base;
  b: Bool;
  c: Int;
  d: String;
}

contract MixNest {
  val: Container;

  init() {
    self.val = Container{ a: Base{ x:1, y:true }, b:false, c:9, d:"cc" };
  }
}
