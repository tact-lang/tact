struct WithStringDefault {
    s: String = "default";
}

contract StringDefaultContract {
    data: WithStringDefault;

    init() {
        self.data = WithStringDefault{};
    }
}