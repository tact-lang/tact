struct Inner {
  val: Int = 7;
  flag: Bool?;
}

struct Outer {
  count: Int;
  nested: Inner;
}

contract TestContract {
  box: Outer;

  init() {
    self.box = Outer{
      count: 123,
      nested: Inner{}
    };
  }
}