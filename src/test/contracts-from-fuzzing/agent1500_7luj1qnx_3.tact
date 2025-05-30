struct Deep {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: Address;
}

struct Container {
  nested: Deep;
  flag: Bool = false;
}

contract NestedStructStorage {
  record: Container;

  init() {
    self.record = Container{
      nested: Deep{
        f1: 10, f2: true, f3: "x", f4: null, f5: myAddress()
      },
      flag: true
    };
  }
}