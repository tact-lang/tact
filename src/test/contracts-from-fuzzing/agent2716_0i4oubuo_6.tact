struct SDeep {
  d: Int;
}

struct Wrap1 {
  f1: SDeep;
}

struct Wrap2 {
  f2: Wrap1;
}

struct Wrap3 {
  f3: Wrap2;
}

contract DeepWrap {
  data: Wrap3;

  init() {
    self.data = Wrap3{f3: Wrap2{f2: Wrap1{f1: SDeep{d: 123}}}};
  }
}