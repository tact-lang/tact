struct Pair { x: Int; y: Int; }

struct Nest {
  p1: Pair;
  p2: Pair;
}

struct Holder {
  n1: Nest;
  n2: Nest;
}

contract DenseDup {
  storage: Holder;

  init() {
    self.storage = Holder{
      n1: Nest{
        p1: Pair{ x: 1, y: 2 },
        p2: Pair{ x: 3, y: 4 }
      },
      n2: Nest{
        p1: Pair{ x: 5, y: 6 },
        p2: Pair{ x: 7, y: 8 }
      }
    };
  }
}