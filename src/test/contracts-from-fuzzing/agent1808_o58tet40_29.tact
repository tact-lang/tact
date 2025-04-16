struct InnerMost {
  field: Int;
}

struct Middle {
  inner1: InnerMost;
  inner2: InnerMost;
}

struct Outer {
  mid1: Middle;
  mid2: Middle;
}

struct Top {
  o1: Outer;
  o2: Outer;
}

contract MegaNest {
  data: Top;

  init() {
    self.data = Top{
      o1: Outer{
        mid1: Middle{ inner1: InnerMost{field:1}, inner2: InnerMost{field:2} },
        mid2: Middle{ inner1: InnerMost{field:3}, inner2: InnerMost{field:4} }
      },
      o2: Outer{
        mid1: Middle{ inner1: InnerMost{field:5}, inner2: InnerMost{field:6} },
        mid2: Middle{ inner1: InnerMost{field:7}, inner2: InnerMost{field:8} }
      }
    };
  }
}