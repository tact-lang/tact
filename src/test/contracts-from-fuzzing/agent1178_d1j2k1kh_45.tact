// struct with optional and default primitive, deeply nested
struct Leaf { val: Int?; }
struct Mid { leaf: Leaf; }
struct Top { mid: Mid; }
contract Test {
  data: Top;
  init() {
    self.data = Top{
      mid: Mid{ leaf: Leaf{ val: null} }
    };
  }
}