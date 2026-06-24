struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
}

contract StructDefaultFields {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
    receive() {}
}