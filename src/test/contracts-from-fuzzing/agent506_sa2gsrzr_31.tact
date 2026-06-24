struct Pair {
  left: Int;
  right: Int;
}

struct Container {
  p1: Pair;
  p2: Pair;
  p3: Pair;
}

contract TriplePairs {
  state: Container;

  init() {
    self.state = Container{
      p1: Pair{left:1,right:2},
      p2: Pair{left:3,right:4},
      p3: Pair{left:5,right:6}
    };
  }
}