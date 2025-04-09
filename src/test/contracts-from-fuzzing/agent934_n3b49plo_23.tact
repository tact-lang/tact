struct A { a: Int }

contract NestedArrays {
  nested1: A;
  nested2: A;
  nested3: A;

  init() {
    self.nested1 = A{a:1};
    self.nested2 = A{a:2};
    self.nested3 = A{a:3};
  }
}