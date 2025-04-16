struct WithStringDefault {
    s: String = "hello";
}

contract StringDefaultWrapped {
    data: WithStringDefault;

    init() {
        self.data = WithStringDefault{};
    }
}