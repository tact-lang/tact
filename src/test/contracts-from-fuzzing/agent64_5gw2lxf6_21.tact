struct Inner1 { val: Int }
struct Inner2 { inner: Inner1 }
struct Inner3 { inner: Inner2 }

contract ComplexNested {
  nested: Inner3;

  init() {
    self.nested = Inner3{ inner: Inner2{ inner: Inner1{ val: 7 } } };
  }
}