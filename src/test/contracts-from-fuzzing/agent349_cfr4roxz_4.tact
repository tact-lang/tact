struct A {
  x: Int;
}

struct B {
  a: A;
  flag: Bool;
}

struct C {
  b: B?;
  text: String;
}

contract NestedMixed {
  val: C;
  init() {
    self.val = C{
      b: B{ a: A{ x: 123 }, flag: false },
      text: "hi",
    };
  }
}