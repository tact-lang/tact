struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}