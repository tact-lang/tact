struct Compose1 { x: Int; }
struct Compose2 { inner: Compose1; }
struct Compose3 { inner: Compose2; }
struct Compose4 { inner: Compose3; }

contract TestContract {
  data: Compose4;

  init() {
    self.data = Compose4{ inner: Compose3{ inner: Compose2{ inner: Compose1{ x: 42 } } } };
  }
}