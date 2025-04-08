struct InnerOptDef {
  a: Int? = 5;
  b: Bool? = true;
  c: String? = "hi";
}

contract TestContract {
  val: InnerOptDef;

  init() {
    self.val = InnerOptDef{};
  }
}