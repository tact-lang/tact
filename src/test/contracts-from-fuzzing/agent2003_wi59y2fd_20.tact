struct Outer {
  inner1: Inner;
  inner2: Inner;
}

struct Inner {
  val: Int;
  text: String;
  flag: Bool;
}

contract TestC {
  o: Outer;

  init() {
    self.o = Outer{
      inner1: Inner{ val: 1, text: "a", flag: true },
      inner2: Inner{ val: 2, text: "b", flag: false },
    };
  }
}
