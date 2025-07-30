struct WithIntDefault {
    a: Int = 5;
    b: String = "hello";
}

contract UseDefaults {
    x: WithIntDefault;

    init() {
        self.x = WithIntDefault{};
    }
}