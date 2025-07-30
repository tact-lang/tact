struct DeepNested {
  inner1: Inner1;
}

struct Inner1 {
  inner2: Inner2;
}

struct Inner2 {
  x: Int;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{ inner1: Inner1{ inner2: Inner2{ x: 42 } } };
  }
}