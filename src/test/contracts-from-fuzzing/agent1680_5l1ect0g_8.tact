struct InnerOpt {
  x: Int?;
  y: Bool?;
}

struct Container {
  value: InnerOpt?;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{value: InnerOpt{x: null, y: true}};
  }
}
