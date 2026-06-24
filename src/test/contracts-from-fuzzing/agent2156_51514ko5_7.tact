struct Sub {
    x: Int;
    y: String;
}

struct Middle {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract StructSpread {
    outer: Outer;

    init() {
      self.outer = Outer{
        m1: Middle{
          s1: Sub{ x: 1, y: "a" },
          s2: Sub{ x: 2, y: "b" },
          s3: Sub{ x: 3, y: "c" }
        },
        m2: Middle{
          s1: Sub{ x: 4, y: "d" },
          s2: Sub{ x: 5, y: "e" },
          s3: Sub{ x: 6, y: "f" }
        }
      };
    }
}