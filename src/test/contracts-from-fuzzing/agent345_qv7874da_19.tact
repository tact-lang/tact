struct BigNested {
  n1: Int;
  n2: Bool;
  n3: String;
  n4: Address;
  n5: Slice;
  n6: Cell;
  n7: Int?;
  n8: Bool?;
  n9: String?;
}

contract Test {
  value: BigNested;

  init() {
    self.value = BigNested{
      n1: 1,
      n2: true,
      n3: "test",
      n4: myAddress(),
      n5: emptyCell().asSlice(),
      n6: emptyCell(),
      n7: null,
      n8: null,
      n9: null
    };
  }
}