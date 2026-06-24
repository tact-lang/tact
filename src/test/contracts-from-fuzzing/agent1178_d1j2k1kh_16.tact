struct Leaf { a: Int; }
struct Mid { b: Leaf; }
struct Top {
  c: Mid;
  d: Bool;
}
contract Test {
  data: Top;
  init() {
    self.data = Top{c: Mid{b: Leaf{a:42}}, d: true};
  }
}