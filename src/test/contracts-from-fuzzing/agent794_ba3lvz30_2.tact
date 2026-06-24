struct Child {
  flag: Bool?;
}

struct Parent {
  count: Int?;
  child: Child;
}

contract ComplexContract {
  data: Parent;

  init() {
    self.data = Parent{
      count: null,
      child: Child{ flag: true }
    };
  }
}
