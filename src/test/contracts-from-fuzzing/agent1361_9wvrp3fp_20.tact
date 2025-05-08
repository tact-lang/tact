struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String;
}

contract PersistDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{c: "hello"};
    }
}