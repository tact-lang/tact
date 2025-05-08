struct WideStruct {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;
}

contract TestContract {
  payload: WideStruct;

  init() {
    self.payload = WideStruct{
      a: 1,
      b: null,
      c: true,
      d: false,
      e: "wide test",
      f: null,
      g: myAddress(),
      h: null,
      i: emptyCell(),
      j: null
    };
  }
}