struct BigNested {
  a: Int;
  b: MidNested;
  c: Int;
}

struct MidNested {
  d: Int;
  e: InnerNested;
}

struct InnerNested {
  f: Int;
  g: InnerMost;
}

struct InnerMost {
  h: Int;
  i: Int;
}

contract LotNestedTest {
  big: BigNested;

  init() {
    self.big = BigNested{
      a:1,
      b: MidNested{
        d:2,
        e: InnerNested{
          f:3,
          g: InnerMost{ h:4, i:5 }
        }
      },
      c:6
    };
  }
}