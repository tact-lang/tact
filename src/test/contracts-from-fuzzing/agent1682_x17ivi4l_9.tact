struct NestedHasOptionals {
  a: Int?;
  b: Bool?;
}

struct Container {
  item: NestedHasOptionals;
}

contract TestContract {
  value: Container;

  init() {
    self.value = Container{
      item: NestedHasOptionals{
        a: null,
        b: null
      }
    };
  }
}