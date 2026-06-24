struct InnerMost {
  val: Int;
}

struct Inner {
  innerMost: InnerMost;
  flag: Bool;
}

struct Outer {
  num: Int;
  inner: Inner;
  text: String;
}

contract NestedStructs {
  data: Outer = Outer{
    num: 5,
    inner: Inner{innerMost: InnerMost{val: 10}, flag: true},
    text: "nest"
  };

  init() {}
}