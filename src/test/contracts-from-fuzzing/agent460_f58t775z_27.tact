struct Mid1 {
  val: Int;
  str: String?;
}

struct Mid2 {
  b: Bool?;
  mid1: Mid1?;
  c: Int;
}

contract NestedOptMiddle {
  data: Mid2 = Mid2{ b: null, mid1: null, c: 5 };
  init() {
    self.data = Mid2{ b: true, mid1: Mid1{ val: 1, str: "a" }, c: 10 };
  }
}
