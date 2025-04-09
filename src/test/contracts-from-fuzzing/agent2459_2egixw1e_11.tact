// Long list of optional and non-optional mixed fields
struct LongMixed {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: String;
  h: String?;
  i: Cell;
  j: Cell?;
  k: Slice;
  l: Slice?;
}

contract TestContract {
  data: LongMixed;

  init() {
    self.data = LongMixed{
      a: 1,
      b: null,
      c: true,
      d: null,
      e: myAddress(),
      f: null,
      g: "hello",
      h: null,
      i: emptyCell(),
      j: null,
      k: emptyCell().asSlice(),
      l: null
    };
  }
}