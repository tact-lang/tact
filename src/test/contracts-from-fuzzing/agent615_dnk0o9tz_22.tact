struct SSS {
  a: Int?;
  b: Bool?;
  c: SubS?;
}

struct SubS {
  x: Int;
  y: Bool?;
}

contract TestContract {
  sss: SSS;

  init() {
    self.sss = SSS{
      a: null,
      b: true,
      c: SubS{
        x: 1,
        y: null
      }
    };
  }
}