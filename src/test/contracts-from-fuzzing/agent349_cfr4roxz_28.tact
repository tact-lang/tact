// Contract with optional struct, the struct has optional nested struct
struct C {
  v: Int?;
}

struct B {
  inner: C?;
}

contract OptStructWithOpt {
  s: B?;
  init() {
    self.s = B{ inner: null };
  }
}