struct Inner {
  id: Int = 100;
  flag: Bool = false;
}

struct Container {
  inner: Inner?;
  note: String = "N/A";
}

contract TestContract {
  entry: Container;

  init() {
    self.entry = Container{
      inner: null,
      note: "test"
    };
  }
}