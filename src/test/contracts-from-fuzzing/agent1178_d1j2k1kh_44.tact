// optional nested struct initialized implicitly to null
struct Inner { x: Int; }
struct Outer { inr: Inner?; }
contract Test {
  data: Outer;

  init() {
    self.data = Outer{ inr: null };
  }
}