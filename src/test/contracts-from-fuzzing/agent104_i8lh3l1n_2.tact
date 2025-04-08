struct Deep1 { a: Int }
struct Deep2 { inner: Deep1 }
struct Deep3 { inner: Deep2 }
struct Deep4 { inner: Deep3 }

contract TestContract {
  deepField: Deep4;

  init() {
    self.deepField = Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ a: 42 } } } };
  }
}
