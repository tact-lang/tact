struct InnerMost { z: Int; }

struct Middle {
  foo: Bool;
  bar: Bool?;
  deep: InnerMost;
}

struct Outer {
  s: String;
  nested: Middle;
}

contract Combined {
  data: Outer;

  init() {
    self.data = Outer{
      s: "hi",
      nested: Middle{
        foo: true,
        bar: null,
        deep: InnerMost{ z: 999 }
      }
    };
  }
}