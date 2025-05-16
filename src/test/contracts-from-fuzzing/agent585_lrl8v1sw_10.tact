struct Big {
  a: Int;
  b: Int as uint32;
  c: Int as int64;
  d: Int as uint8;
  e: Bool;
  f: String;
  g: Address;
}

contract Storage {
  big: Big;
  init() {
    self.big = Big{
      a: 1, b: 2, c: 3, d: 4, e: false, f: "test", g: myAddress()
    };
  }
}