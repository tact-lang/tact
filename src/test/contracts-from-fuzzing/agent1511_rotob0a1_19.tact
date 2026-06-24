struct S1 {
  a: Int;
}

struct S2 {
  b: String;
}

contract MultipleStructTypes {
  one: S1;
  two: S2;

  init() {
    self.one = S1{ a: 42 };
    self.two = S2{ b: "hello" };
  }
}
