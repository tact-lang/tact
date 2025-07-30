struct InnerMost { x: Int; y: String; }
struct Mid {
  val: InnerMost;
  txt: String;
}
struct Outer {
  mid: Mid;
  flag: Bool;
}
contract FlatVsNested {
  a: Int;
  b: String;
  nested: Outer;

  init() {
    self.a = 5;
    self.b = "z";
    self.nested = Outer{mid: Mid{val: InnerMost{x: 1, y: "y"}, txt: "tt"}, flag: true};
  }
}
