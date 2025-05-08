struct Complex {
  number: Int;
  flag: Bool;
  text: String;
  sliceVal: Slice;
  cellVal: Cell;
  addressVal: Address;
  optionalInt: Int?;
  optionalSlice: Slice?;
  optionalText: String?;
}

contract TestContract {
  data: Complex;

  init() {
    self.data = Complex{
      number: 42,
      flag: true,
      text: "sometext",
      sliceVal: emptyCell().asSlice(),
      cellVal: emptyCell(),
      addressVal: myAddress(),
      optionalInt: null,
      optionalSlice: null,
      optionalText: null,
    };
  }
}
