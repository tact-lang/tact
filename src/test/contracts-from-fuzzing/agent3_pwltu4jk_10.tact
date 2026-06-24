struct InnerMost2 {
  x: Int;
  y: Bool?;
}

struct Mid2 {
  a: Int;
  b: InnerMost2;
}

struct Outer2 {
  first: Mid2;
  second: Mid2;
}

contract DeepTree {
  tree: Outer2;

  init() {
    self.tree = Outer2{
      first: Mid2{
        a: 44,
        b: InnerMost2{
          x: 3,
          y: null
        }
      },
      second: Mid2{
        a: 55,
        b: InnerMost2{
          x: 11,
          y: false
        }
      }
    };
  }
}