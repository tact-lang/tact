struct WithDefault {
    x: Int = 123;
    y: Bool = true;
    z: String = "hi";
}

contract DefaultsStruct {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}