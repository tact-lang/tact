struct A {
  inner: B;
}

struct B {
  inner: C;
}

struct C {
  a: Int;
  b: Bool;
  c: String;
}

contract DeepChain {
  val: A;

  init() {
    self.val = A{
      inner: B{
        inner: C{
          a: 1,
          b: true,
          c: "z"
        }
      }
    };
  }
}
