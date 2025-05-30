struct SerializePrimitives {
  a: Int as uint8;
  b: Bool;
  c: Address;
  d: Cell;
  e: Builder;
  f: Slice;
  g: String;
}

contract SerializeTest {
  data: SerializePrimitives;

  init() {
    self.data = SerializePrimitives{
      a: 1,
      b: true,
      c: myAddress(),
      d: emptyCell(),
      e: beginCell(),
      f: emptyCell().asSlice(),
      g: "hi"
    };
  }
}