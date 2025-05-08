struct Inner1 {
  val1: Int;
  val2: Bool;
}

struct Inner2 {
  inner: Inner1;
  flag: Bool;
}

contract DeepNested {
  deep: Inner2;

  init() {
    self.deep = Inner2{inner: Inner1{val1: 5, val2: false}, flag: true};
  }
}