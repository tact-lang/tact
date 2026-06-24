// Deeply nested complex optional chain ending with non-null
struct A { b: B?; }
struct B { c: C?; }
struct C { d: D?; }
struct D { val: Int?; }

contract TestContract {
  data: A?;
  init() {
    self.data = A{b: B{c: C{d: D{val: 66}}}};
  }
}