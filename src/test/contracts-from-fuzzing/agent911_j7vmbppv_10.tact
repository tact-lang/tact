struct WithDefault {
    a: Int = 5;
    b: Bool = false;
    c: String = "x";
}

contract TestWithDefault {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}