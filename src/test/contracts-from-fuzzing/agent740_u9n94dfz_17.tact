struct DiverseStruct {
  a: Int;
  b: Bool?;
  c: String;
  d: Cell?;
  e: Address;
}

contract DiverseStructContract {
  s: DiverseStruct;

  init() {
    self.s = DiverseStruct{
      a: 5,
      b: null,
      c: "xyz",
      d: null,
      e: myAddress(),
    };
  }
}