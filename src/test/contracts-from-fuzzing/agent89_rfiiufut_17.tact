struct Outer2 {
  inner1: Inner1;
  inner2: Inner2;
}

struct Inner1 {
  x: Int;
}

struct Inner2 {
  y: Bool;
}

contract MultipleNested {
  s: Outer2;

  init() {
    self.s = Outer2 {
      inner1: Inner1 { x:42 },
      inner2: Inner2 { y:true }
    };
  }
}
