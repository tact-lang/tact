// nested optional message struct
message(11) InnerMsg {
  n: Int;
}

struct Container {
  m: InnerMsg?;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{m: null};
  }
}