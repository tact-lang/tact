struct InnerMost {
  a: Int;
}

struct Inner {
  b: InnerMost;
}

struct Middle {
  c: Inner;
}

struct Outer {
  d: Middle;
}

contract VeryDeepNested {
  val: Outer;

  init() {
    self.val = Outer{
      d: Middle{
        c: Inner{
          b: InnerMost{ a: 10 }
        }
      }
    };
  }
}