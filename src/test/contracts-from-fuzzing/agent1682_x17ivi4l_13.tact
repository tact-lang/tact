struct HasString {
  s: String;
}

struct Container {
  field: HasString;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      field: HasString{ s: "hello" }
    };
  }
}