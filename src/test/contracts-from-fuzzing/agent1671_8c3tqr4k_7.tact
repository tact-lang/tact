struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract Test {
    st: HasDefaults;

    init() {
        self.st = HasDefaults{};
    }
}