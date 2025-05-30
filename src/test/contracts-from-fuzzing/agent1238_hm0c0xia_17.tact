struct Nested {
  x: Int = 42;
  y: Bool = true;
  z: String = "hi";
}

struct Container {
  nest: Nested;
  flag: Bool;
}

contract Defaults2 {
  data: Container;
  init() {
    self.data = Container{
      nest: Nested{ x: 100 },
      flag: true
    };
  }
}