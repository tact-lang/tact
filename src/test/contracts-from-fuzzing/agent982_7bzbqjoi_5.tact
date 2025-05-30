struct NestedDefaults {
    a: Int = 1;
    b: Int?;
    c: Int = 3;
    d: Int?;
}

contract DefaultsContract {
    nested: NestedDefaults;

    init() {
        self.nested = NestedDefaults{};
    }
}