struct Sub {
  x: Int;
  y: Bool;
}

struct Top {
  sub: Sub;
  flag: Bool;
}

contract NestedAssign {
  f: Top;
  init() {
    self.f = Top{
      sub: Sub{
        x:5,
        y:true
      },
      flag: true
    };
  }
}