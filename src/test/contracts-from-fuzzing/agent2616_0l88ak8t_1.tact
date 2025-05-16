struct BigStruct {
  i1: Int;
  i2: Bool;
  i3: Address;
  i4: String;
  i5: Int?;
  i6: Bool?;
  i7: String?;
  i8: Address?;
}

contract TestContract {
  bigField: BigStruct;

  init() {
    self.bigField = BigStruct{
      i1: 1,
      i2: true,
      i3: myAddress(),
      i4: "hello",
      i5: null,
      i6: false,
      i7: null,
      i8: null
    };
  }
}
