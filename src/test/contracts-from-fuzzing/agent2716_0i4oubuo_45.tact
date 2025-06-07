struct Outer {
  a: Int;
  b: Int;
}

contract NestedThenDirect {
  nested: Outer;
  direct: Int;
  init() {
    self.nested = Outer{a:1,b:2};
    self.direct = 3;
  }
}