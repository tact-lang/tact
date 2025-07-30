struct NullablePrimitives {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract NullablePrimTest {
  np: NullablePrimitives;

  init() {
    self.np = NullablePrimitives{
      a:null, b:null, c:null, d:null, e:null, f:null
    };
  }
}