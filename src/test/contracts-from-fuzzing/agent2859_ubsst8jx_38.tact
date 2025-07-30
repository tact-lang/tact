struct Outer {
  f: Inner1;
}

struct Inner1 {
  f: Inner2;
}

struct Inner2 {
  f: Inner3;
}

struct Inner3 {
  x: Int;
}

contract NestingDepth4 {
  d: Outer;

  init() {
    self.d = Outer {
      f: Inner1 { f: Inner2 { f: Inner3 { x:1 } } }
    };
  }
}