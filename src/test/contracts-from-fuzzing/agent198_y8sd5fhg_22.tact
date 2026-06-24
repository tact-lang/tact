struct WithDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "hi";
}

contract DefaultsStruct {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
