struct Blob {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
}

contract BlobContract {
  b: Blob;

  init() {
    self.b = Blob{
      a: 42,
      b: true,
      c: "hi",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress(),
    };
  }
}