struct MultipleOptionals {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
  e: Cell?;
}

contract ManyOptionalsTest {
  data: MultipleOptionals;

  init() {
    self.data = MultipleOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}