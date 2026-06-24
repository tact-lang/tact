struct Deep {
  a: Int;
  b: Mid;
}

struct Mid {
  c: Int;
  d: SubMid;
}

struct SubMid {
  e: Int;
  f: Leaf;
}

struct Leaf {
  g: String;
}

contract TestContract {
  data: Deep;

  init() {
    self.data = Deep{
      a: 1,
      b: Mid{
        c: 2,
        d: SubMid{
          e: 3,
          f: Leaf{
            g: "hello"
          }
        }
      }
    };
  }
}