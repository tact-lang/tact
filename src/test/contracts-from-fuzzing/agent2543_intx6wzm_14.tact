struct SOpt {
  s: String = "hi";
  i: Int?;
}

struct Container {
  c: SOpt?;
}

contract DefaultOpt {
  data: Container;
  init() {
    self.data = Container{
      c: null
    };
  }
}