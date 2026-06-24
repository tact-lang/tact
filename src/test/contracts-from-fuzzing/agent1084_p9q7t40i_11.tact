struct A {
  val1: Int?;
}

struct B {
  val2: Bool?;
}

struct C {
  a: A?;
  b: B?;
}

contract TestContract {
  c: C = C{};
  init() {}
  receive() {}
}