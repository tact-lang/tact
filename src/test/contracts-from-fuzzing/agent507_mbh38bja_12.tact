struct Base {
  a: Int;
}

struct Mid {
  b: Base;
}

struct Cmpx {
  opt1: Mid?;
  opt2: Base?;
}

contract OptNestedStruct {
  data: Cmpx;

  init() {
    self.data = Cmpx{ opt1: null, opt2: null };
  }
}
