// deeply nested optional-in-struct-in-optional
struct Middle {
  val: Int;
}

struct Outer {
  mid: Middle?;
}

contract Layering {
  outer: Outer?;

  init() {
    self.outer = Outer{ mid: Middle{ val: 77 } };
  }
}