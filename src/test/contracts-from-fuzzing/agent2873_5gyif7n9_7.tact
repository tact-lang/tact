struct WithDefaults {
    a: Bool = true;
    b: Int = 5;
    c: String = "hi";
}

contract DefaultsInStruct {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{};
    }
}