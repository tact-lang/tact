struct StructA {
  x: Int
}

struct StructB {
  a: StructA;
  y: Bool;
}

struct StructC {
  b: StructB;
  msg: String?;
}

contract MultiNested {
    s: StructC;

    init() {
      self.s = StructC{
        b: StructB{
          a: StructA{ x: 10 },
          y: false
        },
        msg: null
      };
    }
}