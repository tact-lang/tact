struct ThirdLevel {
  leaf1: Bool;
  leaf2: String;
}

struct SecondLevel {
  branch1: Int;
  branch2: ThirdLevel;
}

struct FirstLevel {
  rootVal: Int;
  nested: SecondLevel;
}

contract TestContract {
  tree: FirstLevel;

  init() {
    self.tree = FirstLevel{
      rootVal: 99,
      nested: SecondLevel{
        branch1: 123,
        branch2: ThirdLevel{
          leaf1: true,
          leaf2: "leaf"
        }
      }
    };
  }
}