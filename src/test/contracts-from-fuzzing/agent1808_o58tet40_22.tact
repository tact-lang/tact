struct Complex {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Cell;
  oa: Int?;
  ob: Bool?;
  oc: Address?;
  od: String?;
  oe: Cell?;
}

contract AllTypes {
  c: Complex;

  init() {
    self.c = Complex{
      a: 1,
      b: true,
      c: myAddress(),
      d: "str",
      e: emptyCell(),
      oa: null,
      ob: null,
      oc: null,
      od: null,
      oe: null
    };
  }
}