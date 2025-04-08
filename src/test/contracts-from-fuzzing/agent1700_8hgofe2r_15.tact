struct A {
  x: Int?;
}

struct B {
  y: A?;
}

contract TestContract {
  z: B;

  init() {
    self.z = B{ y: null };
  }
}