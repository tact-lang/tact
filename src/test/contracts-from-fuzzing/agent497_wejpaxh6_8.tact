struct NestedOptDefaults {
  a: Int?; // implicitly null
  b: Bool? = true;
  c: String? = "hi";
}

contract TestContract {
  data: NestedOptDefaults?;

  init() {
    self.data = null;
  }
}