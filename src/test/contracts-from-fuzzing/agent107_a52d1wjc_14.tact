struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
}

contract DefaultsStruct {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}