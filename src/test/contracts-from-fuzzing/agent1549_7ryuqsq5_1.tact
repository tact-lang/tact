struct B {
  num: Int;
  flag: Bool;
}

struct A {
  nested: B;
  text: String;
}

contract Test {
  data: A;
  init() {
    self.data = A{ nested: B{num: 5, flag: false}, text: "hello" };
  }
}