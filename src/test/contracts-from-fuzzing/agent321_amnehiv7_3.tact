struct A {
  a1: Int;
  a2: Bool;
  a3: String;
  a4: Cell;
  a5: Address;
  a6: Int?;
  a7: Bool?;
  a8: String?;
  a9: Cell?;
  a10: Address?;
}

contract ManyFieldTypes {
  storage: A;

  init() {
    self.storage = A{
      a1: 1,
      a2: true,
      a3: "hi",
      a4: emptyCell(),
      a5: myAddress(),
      a6: null,
      a7: null,
      a8: null,
      a9: null,
      a10: null
    };
  }
}