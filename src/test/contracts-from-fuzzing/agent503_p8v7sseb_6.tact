struct Bottom {
  x: Int;
  y: Bool;
}

struct Middle {
  b: Bottom;
}

struct Top {
  m: Middle;
}

contract DeepChain {
  data: Top;

  init() {
    self.data = Top{
      m: Middle{
        b: Bottom{
          x: 100,
          y: true
        }
      }
    };
  }
}
