struct ExampleStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Int?;
  g: Bool?;
  h: String?;
  i: Cell?;
  j: Address?;
}

contract ManyTypesPersistent {
  data: ExampleStruct;

  init() {
    self.data = ExampleStruct{
      a: 1,
      b: true,
      c: "hello",
      d: emptyCell(),
      e: myAddress(),
      f: null,
      g: null,
      h: null,
      i: null,
      j: null,
    };
  }
}
