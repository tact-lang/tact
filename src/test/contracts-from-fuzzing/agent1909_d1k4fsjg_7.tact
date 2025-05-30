struct WithDefault {
    f: Int = 10;
    g: Bool = true;
    h: String = "default";
}

contract DefaultStructField {
    s: WithDefault;

    init() {
        self.s = WithDefault{};
    }
}