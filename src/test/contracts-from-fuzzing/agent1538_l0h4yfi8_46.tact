struct A { x: Int }

contract NestedOptOuter {
  a: A?;

  init() {
    self.a = A{ x: 7 };
  }
}