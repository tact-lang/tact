struct VariousPrimitives {
  x: Int;
  y: Bool;
  z: Address;
  c: Cell;
  s: Slice;
  str: String;
}

contract PrimFields {
  store: VariousPrimitives;

  init() {
    self.store = VariousPrimitives{
      x: 10,
      y: true,
      z: myAddress(),
      c: emptyCell(),
      s: emptyCell().asSlice(),
      str: "hello",
    };
  }
}
