struct WithDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "default";
}

contract TestContract {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
