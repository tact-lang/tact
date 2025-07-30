struct HasString {
  text: String;
  flag: Bool;
}

struct Container {
  item: HasString;
  number: Int;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      item: HasString{text: "hello", flag: true},
      number: 777
    };
  }
}
