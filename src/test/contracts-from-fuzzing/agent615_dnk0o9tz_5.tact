struct OptStruct {
  s: Inner?;
}

struct Inner {
  val: Int;
}

contract TestContract {
  state: OptStruct;

  init() {
    self.state = OptStruct{
      s: null
    };
  }
}