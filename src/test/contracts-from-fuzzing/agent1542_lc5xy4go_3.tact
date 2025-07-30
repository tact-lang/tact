struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract OptionalsTest {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{a: null, b: null, c: null, d: null};
  }
}