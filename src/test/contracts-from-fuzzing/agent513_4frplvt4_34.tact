struct HasDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "ok";
}

contract Test {
    f: HasDefaults;

    init() {
        self.f = HasDefaults{};
    }

    receive() {}
}