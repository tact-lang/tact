// Deep optional String inside nested structs
struct Inner {
  s: String?;
}

struct Middle {
  i: Inner;
}

struct Outer {
  m: Middle;
}

contract Tester {
  o: Outer;

  init() {
    self.o = Outer{m: Middle{i: Inner{s: null}}};
  }
}