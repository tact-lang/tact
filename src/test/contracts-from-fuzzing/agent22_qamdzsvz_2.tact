struct WideOptionalStruct {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: String?;
}

contract TestWideOptionalFields {
  data: WideOptionalStruct;

  init() {
    self.data = WideOptionalStruct{ a: null, b: null, c: null, d: null, e: null };
  }
}