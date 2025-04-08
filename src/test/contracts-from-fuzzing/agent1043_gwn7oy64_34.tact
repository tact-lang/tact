// Test duplicate struct in fields
struct Foo { a: Int }

contract TestContract {
  f1: Foo;
  f2: Foo;

  init() {
    self.f1 = Foo{ a: 10 };
    self.f2 = Foo{ a: 20 };
  }
}