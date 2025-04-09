struct Deep {
  foo: Int;
}

struct Outer {
  maybeDeep: Deep?;
  tag: String;
}

contract TestContract {
  record: Outer;

  init() {
    self.record = Outer{
      maybeDeep: Deep{foo: 99},
      tag: "opt in nested"
    };
  }
}