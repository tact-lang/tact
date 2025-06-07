struct Mix {
  intf: Int;
  boolf: Bool;
  addr: Address;
  cellf: Cell;
  slice: Slice;
  str: String;
}

contract MixedTypes {
  data: Mix;
  init() {
    self.data = Mix{
      intf:1,
      boolf:true,
      addr: myAddress(),
      cellf: emptyCell(),
      slice: emptyCell().asSlice(),
      str: "hello"
    };
  }
}