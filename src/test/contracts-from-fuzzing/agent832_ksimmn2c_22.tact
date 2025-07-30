struct WithStringDefaults {
    a: String = "Hello";
    b: String = "";
    c: String = "World";
}

contract DefaultStrings {
    data: WithStringDefaults;

    init() {
        self.data = WithStringDefaults{};
    }
}