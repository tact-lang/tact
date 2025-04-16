// long struct mostly optionals, nested inside persistent var
struct MostlyOpt {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Bool?;
  f: Int?;
}

contract ManyOptionalsStruct {
  m: MostlyOpt;

  init() {
    self.m = MostlyOpt{
      a: null,
      b: 7,
      c: true,
      d: null,
      e: null,
      f: 100
    };
  }
}