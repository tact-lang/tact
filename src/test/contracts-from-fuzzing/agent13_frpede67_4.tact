struct WithDefaults {
  a: Int = 7;
  b: Bool = true;
}

contract TestContract {
    val: WithDefaults;
    init() {
        self.val = WithDefaults { a: 100, b: false };
    }
}