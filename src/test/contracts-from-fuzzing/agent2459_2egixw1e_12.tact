// struct with nested optional struct inside contract persistent field
struct OptionalInner {
  a: Int;
}

struct Container {
  inner: OptionalInner?;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      inner: null
    };
  }
}