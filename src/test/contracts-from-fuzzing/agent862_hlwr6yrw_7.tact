struct HasDefaults {
    x: Int = 42;
    y: Bool = false;
    z: String = "hello";
}

contract TestDefaults {
    st: HasDefaults;

    init() {
        self.st = HasDefaults{};
    }
}
