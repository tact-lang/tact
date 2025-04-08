struct NestA {
  num: Int;
  txt: String;
}

struct NestB {
  a: NestA;
  b: String;
}

struct NestC {
  bstruct: NestB;
  flag: Bool;
}

contract TripleNested {
  data: NestC;

  init() {
    self.data = NestC{
      bstruct: NestB{
        a: NestA{ num: 5, txt: "x" },
        b: "y"
      },
      flag: true
    };
  }
}
