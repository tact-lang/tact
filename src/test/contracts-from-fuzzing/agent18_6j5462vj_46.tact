struct Weird {
  a: Int;
  b: String;
}

contract WeirdInit {
  foo: Weird = Weird{ a: 5, b: "hi" };
  init() {
    self.foo = Weird{ a: 10, b: "bye" };
  }
}