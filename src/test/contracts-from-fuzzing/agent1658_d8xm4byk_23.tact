struct Messy {
  a: Int;
  b: String?;
  c: Bool;
  d: Address?;
  e: Cell;
  f: Slice?;
  g: Int?;
  h: Bool?;
  i: Address;
  j: String;
}

contract StorageTest {
  var: Messy;

  init() {
    self.var = Messy{
      a: 1,
      b: null,
      c: true,
      d: null,
      e: emptyCell(),
      f: null,
      g: 42,
      h: false,
      i: myAddress(),
      j: "hello"
    };
  }
}