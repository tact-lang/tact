// test struct with lots of optional primitive fields
struct LotsOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
  g: Builder?;
}

contract OptPrimitives {
  data: LotsOptional;

  init() {
    self.data = LotsOptional{
      a: null,
      b: true,
      c: "hi",
      d: null,
      e: emptyCell(),
      f: emptyCell().asSlice(),
      g: beginCell()
    };
  }
}