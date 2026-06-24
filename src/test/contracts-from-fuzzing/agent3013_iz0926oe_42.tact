// Mix of all optional types nested in struct, assigned null
struct Complex {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Nuller {
  val: Complex?;

  init() {
    self.val = null;
  }
}
