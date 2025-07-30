struct Bottom {
  z: Int;
}

struct Middle {
  mid: Bottom?;
}

struct Top {
  up: Middle?;
}

contract TestContract {
  data: Top;

  init() {
    self.data = Top{up: Middle{mid: null}};
  }
}