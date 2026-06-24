struct A { val: Int }
struct B { val: Int }
struct OptStruct {
  a: A?;
  b: B?;
}

contract NestedOptionals {
  inner: OptStruct?;
  init() {
    self.inner = null;
  }
}