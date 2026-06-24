struct InnerDefaults {
    a: Int = 7;
    b: Bool = false;
}

contract StructDefaultFields {
    s: InnerDefaults;

    init() {
        self.s = InnerDefaults{};
    }
}