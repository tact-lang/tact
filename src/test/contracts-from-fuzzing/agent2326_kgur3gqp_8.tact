struct Sub {
  z: Int?;
}

struct Middle {
  y: Sub?;
}

struct Top {
  x: Middle?;
}

contract Test {
  val: Top;

  init() {
    self.val = Top{
      x: Middle{
        y: Sub { z: 123 },
      },
    };
  }
}