struct WithDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultsContract {
    record: WithDefaults;

    init() {
        self.record = WithDefaults{};
    }
}