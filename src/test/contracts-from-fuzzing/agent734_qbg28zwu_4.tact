struct Inner {
  x: Int;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
  someBool: Bool;
  someString: String;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      inner1: Inner{x: 1},
      inner2: Inner{x: 2},
      someBool: false,
      someString: "hi"
    };
  }
}