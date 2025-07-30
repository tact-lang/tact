struct Nested {
  flag: Bool? = null;
  count: Int = 0;
}

struct Container {
  text: String;
  number: Int?;
  data: Nested;
}

contract TestPersistent {
  store: Container;

  init() {
    self.store = Container{
      text: "hello",
      number: null,
      data: Nested{}
    };
  }
}