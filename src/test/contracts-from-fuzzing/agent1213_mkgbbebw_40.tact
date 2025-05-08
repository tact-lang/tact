struct PrimitiveOptStruct {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Cell?;
  f: Slice?;
}

contract OptPrimitivesTest {
  s: PrimitiveOptStruct;

  init() {
    self.s = PrimitiveOptStruct{
      a: null, b: null, c:null, d:null, e:null, f:null
    };
  }
}