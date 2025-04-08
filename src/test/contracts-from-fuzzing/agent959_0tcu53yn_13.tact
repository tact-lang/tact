struct Outer {
  a: Int;
  inner: Inner1;
  optInner: Inner2?;
}

struct Inner1 {
  b: Bool;
}

struct Inner2 {
  s: String;
}

contract MixedOptionals {
  state: Outer;
  init() {
    self.state = Outer{
      a:1,
      inner:Inner1{b:true},
      optInner: null
    };
  }
}