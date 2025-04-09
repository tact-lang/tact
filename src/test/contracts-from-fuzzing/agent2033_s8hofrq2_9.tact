struct WithDefaults {
  x: Int = 10;
  y: Bool = false;
  z: String = "z";
}

contract Test {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}