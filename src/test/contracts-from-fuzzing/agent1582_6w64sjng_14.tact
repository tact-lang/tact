struct WithDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract StructWithDefaultsContract {
    w: WithDefaults;
    init() {
        self.w = WithDefaults{};
    }
}