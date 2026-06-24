struct Out {
  x: Int;
}

struct Mid {
  y: Out;
}

struct In {
  z: Mid;
}

contract ChainNested {
  item: In;

  init() {
    self.item = In{
      z: Mid{
        y: Out{
          x: 77
        }
      }
    };
  }
}