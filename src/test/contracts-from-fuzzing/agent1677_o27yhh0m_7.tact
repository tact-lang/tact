struct WithDefaults {
    x: Int = 3;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}