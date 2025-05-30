struct Inner {
  a: Int;
  b: Bool;
}

contract DeepNest {
  data: Inner;

  init() {
    self.data = Inner{a:1, b:true};
  }
}