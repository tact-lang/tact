struct MultiTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Slice;
  g: Builder;
  h: Int?;
  i: Bool?;
  j: String?;
}

contract MultiTypesPersist {
  val: MultiTypes;

  init() {
    self.val = MultiTypes{
      a: 1, b: true, c: "abc", d: emptyCell(), e: myAddress(), f: emptyCell().asSlice(), g: beginCell(),
      h: null, i: false, j: null
    };
  }
}
