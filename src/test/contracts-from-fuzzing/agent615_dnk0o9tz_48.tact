struct NestedOptDefaults {
  a: Inner?;
}
struct Inner {
  val: Int? = null;
}

contract TestContract {
  s: NestedOptDefaults;

  init() {
    self.s = NestedOptDefaults{ a: Inner{} };
  }
}