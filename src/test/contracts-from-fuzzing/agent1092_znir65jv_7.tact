struct Leaf {
  x: Int;
}

struct Mid1 {
  leaf: Leaf;
}

struct Mid2 {
  mid1: Mid1;
}

struct Top {
  mid2: Mid2;
}

contract DeepChain {
  data: Top;

  init() {
    self.data = Top{
      mid2: Mid2{
        mid1: Mid1{
          leaf: Leaf{
            x: 42
          }
        }
      }
    };
  }
}
