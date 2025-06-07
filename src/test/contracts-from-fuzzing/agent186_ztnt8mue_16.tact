// Nested optionals inside a struct within persistent storage
// But avoid nested optionals types (known unsupported)
struct A {
  f1: Int?;
  f2: Bool?;
}

struct B {
  a: A?;
  label: String;
}

contract TestContract {
  dat: B;
  init() {
    self.dat = B{ a: null, label: "hi" };
  }
}