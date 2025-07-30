struct InnerOne {
  a: Int as uint8;
  b: Bool;
}

struct OuterTwo {
  inner1: InnerOne;
  inner2: InnerOne;
}

contract SerialNested {
  data: OuterTwo;

  init() {
    self.data = OuterTwo{
      inner1: InnerOne{ a: 250, b: true },
      inner2: InnerOne{ a: 5, b: false }
    };
  }
}