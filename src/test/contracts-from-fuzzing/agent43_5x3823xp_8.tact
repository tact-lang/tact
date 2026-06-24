struct NestedDefaults {
    x: Int = 42;
    y: Int?;
}

contract NestedWithDefaults {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{
            y: null
        };
    }
}
