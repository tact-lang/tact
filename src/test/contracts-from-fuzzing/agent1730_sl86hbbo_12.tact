struct ManyOptionalStruct {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
  e: Slice?;
  f: Cell?;
}

contract OptionalStructTest {
  data: ManyOptionalStruct?;

  init() {
    self.data = null;
  }
}