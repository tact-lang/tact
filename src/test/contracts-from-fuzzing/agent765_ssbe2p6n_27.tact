struct OptLayer2 {
  val: Int?;
}

struct OptLayer1 {
  inner: OptLayer2?;
}

contract NestedNullables {
  n: OptLayer1?;
  init() {
    self.n = null;
  }
}