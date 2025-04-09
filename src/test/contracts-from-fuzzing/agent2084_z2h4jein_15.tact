struct A {
  x: Int;
  y: B;
}

struct B {
  flag: Bool;
  z: String;
}

contract Test {
  val: A;

  init() {
    self.val = A{
      x: 53,
      y: B{
        flag: true,
        z: "nested"
      }
    };
  }
}