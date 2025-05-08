struct PrimitivesWide {
  i: Int;
  b: Bool;
  a: Address;
  s: String;
  c: Cell;
  sl: Slice;
  bu: Builder;
  oi: Int?;
  ob: Bool?;
  oa: Address?;
  os: String?;
  oc: Cell?;
  osl: Slice?;
  obu: Builder?;
}

contract AllPrimitiveOptions {
  data: PrimitivesWide;

  init() {
    self.data = PrimitivesWide{
      i: 1,
      b: false,
      a: myAddress(),
      s: "s",
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      bu: beginCell(),
      oi: null,
      ob: null,
      oa: null,
      os: null,
      oc: null,
      osl: null,
      obu: null,
    };
  }
}