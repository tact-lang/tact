struct Mixed {
  foo: Int;
  bar: Bool;
  baz: Address;
  qux: Cell;
  s: Slice;
  txt: String;
}

contract ManyTypes {
  data: Mixed;

  init() {
    self.data = Mixed{
      foo: 1,
      bar: true,
      baz: myAddress(),
      qux: emptyCell(),
      s: emptyCell().asSlice(),
      txt: "hi"
    };
  }
}