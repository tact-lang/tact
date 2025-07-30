struct A { val: Int; }
struct B { inner: A; }

contract InitNested {
  data: B;

  init() {
    self.data = B{ inner: A{ val: 10 } };
  }
}
