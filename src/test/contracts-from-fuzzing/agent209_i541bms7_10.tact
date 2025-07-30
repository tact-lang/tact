// Large struct with various field types including optionals
struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: String?;
  k: Cell?;
  l: Slice?;
}

contract LargeStructContract {
  field: LargeStruct;

  init() {
    self.field = LargeStruct{
      a: 1,
      b: true,
      c: "abc",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: 2,
      h: null,
      i: null,
      j: null,
      k: null,
      l: null,
    };
  }
}