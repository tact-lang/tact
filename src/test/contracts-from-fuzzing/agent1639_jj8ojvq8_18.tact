struct NestedDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "xyz";
}

contract StructDefaultsField {
    st: NestedDefaults;

    init() {
        self.st = NestedDefaults{};
    }
}
