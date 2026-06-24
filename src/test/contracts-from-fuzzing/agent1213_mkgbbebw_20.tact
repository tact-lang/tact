struct Inner {
  x: Int;
  y: Bool;
  z: String;
}

struct Outer {
  a: Inner;
  b: Inner;
  c: Inner;
  d: Inner;
}

contract RepeatStructs {
  val: Outer;

  init() {
    let i = Inner{ x:1,y:true,z:"test" };
    self.val = Outer{ a:i, b:i, c:i, d:i };
  }
}