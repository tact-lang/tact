struct WithDefault {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

contract DefaultVals {
    v: WithDefault;

    init() {
        self.v = WithDefault{};
    }
}