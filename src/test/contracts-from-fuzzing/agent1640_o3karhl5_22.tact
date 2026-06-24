struct BigNestedDefaults {
  inner: WithDefaults;
  flag: Bool;
  text: String;
}

struct WithDefaults {
  a: Int = 1;
  b: Bool = false;
}

contract BigContract {
  val: BigNestedDefaults;

  init() {
    self.val = BigNestedDefaults{ inner: WithDefaults{}, flag: true, text: "hello" };
  }
}