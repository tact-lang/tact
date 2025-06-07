struct Inner {
  foo: Int as uint4;
  bar: Int as uint12;
}

struct Outer {
  label: String;
  data: Inner;
  active: Bool;
}

contract TestContract {
  state: Outer;

  init() {
    self.state = Outer{
      label:"abc",
      data:Inner{foo:7, bar:123},
      active:true
    };
  }
}