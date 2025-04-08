struct Nested {
  x: Int = 42;
  y: Bool = true;
  z: String = "hi";
}

struct Container {
  nest: Nested;
  flag: Bool;
}

contract Defaults {
  data: Container;
  init() {
    self.data = Container{
      nest: Nested{},
      flag: false
    };
  }
}