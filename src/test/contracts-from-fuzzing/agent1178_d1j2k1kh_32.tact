// struct with all basic primitive types + optional primitive
struct Prim {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
}

contract Test {
  data: Prim;

  init() {
    self.data = Prim{
      a:1, b:true, c:"abc",
      d:myAddress(),
      e:emptyCell(),
      f: emptyCell().asSlice(),
      g: null
    };
  }
}