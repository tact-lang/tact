struct Deep {
  x: Int;
}

struct Wrap {
  a: Deep;
  b: Deep;
  c: Deep;
  d: Deep;
}

contract ManyNesting {
  a: Wrap;
  b: Wrap;
  c: Wrap;

  init() {
    self.a = Wrap{
      a:Deep{x:1},b:Deep{x:2},c:Deep{x:3},d:Deep{x:4}
    };
    self.b = Wrap{
      a:Deep{x:5},b:Deep{x:6},c:Deep{x:7},d:Deep{x:8}
    };
    self.c = Wrap{
      a:Deep{x:9},b:Deep{x:10},c:Deep{x:11},d:Deep{x:12}
    };
  }
}