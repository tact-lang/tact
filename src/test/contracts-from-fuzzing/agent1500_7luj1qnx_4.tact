struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
}

contract OptionalStorage {
  val: ManyOptionals;

  init() {
    self.val = ManyOptionals{ a: null, b: null, c: null, d: null };
  }
}