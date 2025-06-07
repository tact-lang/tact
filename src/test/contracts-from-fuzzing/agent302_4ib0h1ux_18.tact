struct A {
  val: Int;
}

struct B {
  a: A?;
}

struct C {
  b: B?;
}

contract OptDeepChain {
  c: C;

  init() {
    self.c = C{
      b: null
    };
  }
}