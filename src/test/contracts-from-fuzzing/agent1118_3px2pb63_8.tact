struct ManyOptionals {
  a: Int?; b: Int?; c: String?; d: Bool?; e: Address?;
}

contract AllNullTest {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{ a: null, b: null, c: null, d: null, e: null };
  }
}