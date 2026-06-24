struct Wide {
  i1: Int;
  i2: Int?;
  s1: String;
  s2: String?;
  b1: Bool;
  b2: Bool?;
  addr1: Address;
  addr2: Address?;
  c1: Cell;
  c2: Cell?;
  flag: Bool = false;
}

contract TestContract {
  data: Wide;

  init() {
    self.data = Wide{
      i1: 1, i2: null,
      s1: "test", s2: null,
      b1: true, b2: null,
      addr1: myAddress(), addr2: null,
      c1: emptyCell(), c2: null,
      flag: true
    };
  }
}