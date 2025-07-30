struct MultiLayered {
  a: Int;
  b: String?;
  c: Address;
}

struct Container {
  field1: MultiLayered;
  field2: Int?;
}

contract MultiLayeredStructStorage {
  state: Container;
  init() {
    self.state = Container{
      field1: MultiLayered{a:1,b:"hi",c:myAddress()},
      field2: null
    };
  }
}