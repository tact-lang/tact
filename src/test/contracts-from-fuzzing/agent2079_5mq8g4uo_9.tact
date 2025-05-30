struct P { p: Int }
struct Q { q: Int }
struct R {
  p: P;
  q: Q;
}

contract TestContract {
  nested: R;
  init() {
    self.nested = R{p: P{p:1}, q: Q{q:2}};
  }
}