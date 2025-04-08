struct S1 { f1: Int }
struct S2 { f2: Int }

struct Wrap {
  f1: S1?;
  f2: S2?;
}

contract OptionWrap {
  data: Wrap;

  init() {
    self.data = Wrap{ f1: null, f2: null };
  }
}