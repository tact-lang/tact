struct A {
  a: Int;
}
struct B {
  optA: A?;
  optInt: Int?;
}

contract TestOpt {
  data: B;

  init() {
    self.data = B{
      optA: null,
      optInt: null,
    };
  }
}