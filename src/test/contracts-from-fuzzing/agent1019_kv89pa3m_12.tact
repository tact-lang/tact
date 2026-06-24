struct A { val: Int; }
struct B { x: Int; }
contract OutOfOrder {
  first: B;
  second: A;

  init() {
    self.first = B{ x: 10 };
    self.second = A{ val: 11 };
  }
}
