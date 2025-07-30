struct Wrapper {
  sub: Wrapped;
}

struct Wrapped {
  a: Int;
  b: Bool;
  c: String;
}

contract Test {
  w: Wrapper;
  init() {
    self.w = Wrapper{ sub: Wrapped{ a:1, b:true, c:"str" } };
  }
}