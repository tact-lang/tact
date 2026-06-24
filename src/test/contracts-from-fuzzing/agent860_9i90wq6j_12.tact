struct InnerMost {
  x: Int;
}

struct Middle {
  inn: InnerMost;
}

struct Outer {
  mid: Middle;
}

contract NestedStructField {
  o: Outer;

  init() {
    self.o = Outer{mid: Middle{inn: InnerMost{x: 7}}};
  }
}