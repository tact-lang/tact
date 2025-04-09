struct InnerOne {
  a: Int;
  b: String;
}
struct InnerTwo {
  c: Int?;
  d: Bool?;
}
struct Outer {
  i1: InnerOne;
  i2: InnerTwo;
}
contract MultiNested {
  storage: Outer;

  init() {
    self.storage = Outer{
      i1: InnerOne{ a: 1, b: "str" },
      i2: InnerTwo{ c: null, d: null }
    };
  }
}