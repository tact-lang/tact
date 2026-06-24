struct NegativeDefaults {
    a: Int = -1;
    b: Int = -42;
    c: Int as int64 = -1000;
}

contract NegativeDefaultFields {
    data: NegativeDefaults;

    init() {
        self.data = NegativeDefaults{};
    }
}