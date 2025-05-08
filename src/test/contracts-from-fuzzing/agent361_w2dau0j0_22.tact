struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: String;
}

struct Middle {
  left: Inner1;
  right: Inner2;
}

contract NestedDifferentStructs {
  m: Middle;
  init() {
    self.m = Middle{
      left: Inner1{ a:1 },
      right: Inner2{ b:"b" }
    };
  }
}
