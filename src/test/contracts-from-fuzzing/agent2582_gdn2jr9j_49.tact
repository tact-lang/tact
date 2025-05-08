// explicit null optional + defaulted normal vars
contract Combo {
  a: Int?;
  b: Bool = true;
  c: String = "hi";

  init() {
    self.a = null;
  }
}
