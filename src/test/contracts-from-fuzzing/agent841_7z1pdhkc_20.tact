struct SoftInit {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
  e: Slice?;
  f: Cell?;
}

contract TestContract {
  s: SoftInit = SoftInit{
    a: null,
    b: null,
    c: null,
    d: null,
    e: null,
    f: null,
  };

  init() {
    self.s = SoftInit{
      a: 99,
      b: "str",
      c: true,
      d: myAddress(),
      e: emptyCell().asSlice(),
      f: emptyCell(),
    };
  }
}
