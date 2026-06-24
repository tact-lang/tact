struct WithDefault {
    x: Int = 10;
    y: Bool = true;
    z: String = "default";
}

contract DefaultStruct {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}