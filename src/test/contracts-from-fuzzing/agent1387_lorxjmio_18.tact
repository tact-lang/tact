struct NestedStrings {
  s1: String;
  s2: String;
  optS: String?;
}

struct Container {
  nested: NestedStrings;
  ready: Bool;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      nested: NestedStrings{ s1:"x", s2:"y", optS:null },
      ready: true
    };
  }
}