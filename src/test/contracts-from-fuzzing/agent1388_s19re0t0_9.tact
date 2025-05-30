struct S {
  n: Int;
}

struct Wrapper {
  info: S?;
}

contract OptOptStruct {
  stuff: Wrapper?;

  init() {
    self.stuff = null;
  }
}
