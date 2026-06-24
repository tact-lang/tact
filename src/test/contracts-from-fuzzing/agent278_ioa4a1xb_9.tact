struct WithDefaults {
    x: Int = 5;
    y: String = "hello";
    z: Bool = true;
}

contract DefaultStructField {
    foo: WithDefaults;

    init() {
        self.foo = WithDefaults{};
    }
}