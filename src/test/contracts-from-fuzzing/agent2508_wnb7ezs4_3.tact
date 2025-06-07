struct ManyTypesStruct {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: Builder;
  g: String;
}

contract DiversityFields {
  val: ManyTypesStruct;

  init() {
    self.val = ManyTypesStruct{
      a: 1,
      b: true,
      c: myAddress(),
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: "test"
    };
  }
}
