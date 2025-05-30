struct NestedDefaults {
  a: Int = 1;
  b: Bool = true;
}

struct Container {
  inner: NestedDefaults;
  text: String = "hello";
}

contract TestContract {
  val: Container;
  init() {
    self.val = Container{inner: NestedDefaults{}, text: "hello"};
  }
}