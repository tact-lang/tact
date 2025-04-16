struct Nested1 {
  a: Int;
}
struct Nested2 {
  n1: Nested1;
}
struct Nested3 {
  n2: Nested2;
}
contract Test {
  field: Nested3;
  init() {
    self.field = Nested3{ n2: Nested2{ n1: Nested1{ a: 7 } } };
  }
}