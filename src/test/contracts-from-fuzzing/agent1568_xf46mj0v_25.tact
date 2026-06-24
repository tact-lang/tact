struct Reorder {
  a: Int;
  b: Bool;
  c: String;
}

contract AssignOrder {
  s: Reorder;

  init() {
    self.s = Reorder{
      c: "z",
      a: 42,
      b: true,
    };
  }
}