// Testing very nested optional structs containing nested optionals
struct D { val: Int?; }
struct C { d: D?; }
struct B { c: C?; }
struct A { b: B?; }

contract NestedOptionals {
  state: A;
  init() {
    self.state = A{ b: null };
  }
}
