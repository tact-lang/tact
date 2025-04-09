struct One {
  x: Int;
}

struct Two {
  a: One;
  b: One;
}

struct Three {
  f: Two;
  g: Two;
}

contract RedundantStructs {
    s: Three;

    init() {
        self.s = Three{
            f: Two{ a: One{ x: 1 }, b: One{ x: 2 } },
            g: Two{ a: One{ x: 3 }, b: One{ x: 4 } }
        };
    }
}