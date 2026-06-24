// Contract with optional struct containing optional String with default
struct NestedOptString {
  val: Int;
  name: String?;
}
contract InitNestedOptString {
  n: NestedOptString?;

  init() {
    self.n = null;
  }
}
