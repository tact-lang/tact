struct InnerMost {
  x: Int;
  y: Bool;
  s: String;
}

struct Inner {
  innerData: InnerMost;
  i: Int?;
}

struct Outer {
  flag: Bool;
  data: Inner;
}

contract NestedOptional {
  state: Outer;

  init() {
    self.state = Outer{
      flag: true,
      data: Inner{
        innerData: InnerMost{
          x: 5,
          y: false,
          s: "string"
        },
        i: null
      }
    };
  }
}