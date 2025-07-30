struct Inner {
  a: Int;
  b: Bool;
}

contract TestContract {
  data: Inner;

  init() {
    self.data = Inner{
      a: 5,
      b: true,
    };
  }
}