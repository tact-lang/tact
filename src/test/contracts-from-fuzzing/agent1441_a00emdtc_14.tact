struct StructA {
  i: Int;
  b: Bool?;
  s: String;
}

struct StructB {
  a: StructA;
  flag: Bool;
}

struct StructC {
  b: StructB;
  extra: Int?;
}

contract DeepOptionals {
  data: StructC;

  init() {
    self.data = StructC {
      b: StructB{
        a: StructA{ i: 1, b: null, s: "a" },
        flag: false
      },
      extra: null
    };
  }

  receive() {
    self.data = StructC {
      b: StructB{
        a: StructA{ i: 42, b: true, s: "b" },
        flag: true
      },
      extra: 777
    };
  }
}