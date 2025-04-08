// deep default optional chain
struct S1 {
  a: Int? = null;
  b: S2? = null;
}

struct S2 {
  c: Int? = null;
  d: String? = null;
}

contract DefOptChain {
  s: S1;

  init() {
    self.s = S1{};
  }
}