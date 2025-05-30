struct A { x: Int }

contract NestedNull {
  a: A?;

  init() {
    self.a = null;
  }
}