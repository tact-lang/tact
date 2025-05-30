struct Deep2 {
  a: Int; 
}

struct Deep1 {
  d2: Deep2; 
}

struct Wrap {
  d1: Deep1;
}

contract AssignNested {
  w: Wrap;
  init() {
    let inner = Deep2{ a: 123 };
    let middle = Deep1{ d2: inner };
    self.w = Wrap{ d1: middle };
  }
}