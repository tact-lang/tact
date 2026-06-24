struct Mid {
  m: Int;
}

struct Outer {
  p: Int;
  inner: Mid;
}

contract MidNested {
  val: Outer;

  init() {
    self.val = Outer{ p:7, inner: Mid{m: 9} };
  }
}