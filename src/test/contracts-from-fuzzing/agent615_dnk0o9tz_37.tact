contract LargeOptionalStruct {
  s: BigOpt;

  init() {
    self.s = BigOpt{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
      h: null,
      i: null,
      j: null
    };
  }
}

struct BigOpt {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Address?;
  f: Int?;
  g: Bool?;
  h: String?;
  i: Address?;
  j: Int?;
}
