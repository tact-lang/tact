struct WithDefaults {
    x: Int = 1;
    y: String = "hi";
    z: Bool = true;
}

contract Test {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}