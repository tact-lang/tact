struct InnerMost { x: Int; }

struct Middle1 { x: InnerMost; }
struct Middle2 { x: InnerMost; }

struct Outer {
  a: Middle1;
  b: Middle2;
}

contract SharedInner {
  val: Outer;

  init() {
    self.val = Outer{
      a: Middle1{ x: InnerMost{ x: 10 } },
      b: Middle2{ x: InnerMost{ x: 20 } }
    };
  }
}