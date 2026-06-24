struct ManyOpt {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Bool?;
  f: Int?;
}

contract DenseNulls {
  data: ManyOpt;

  init() {
    self.data = ManyOpt{
      a: null,
      b: 1,
      c: null,
      d: "abc",
      e: true,
      f: null
    };
  }
}