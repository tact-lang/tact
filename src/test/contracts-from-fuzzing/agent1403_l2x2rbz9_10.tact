struct NestedWithDefaults {
    a: Int = 1;
    b: Bool?;
}

contract WithDefaults {
    s: NestedWithDefaults;

    init() {
        self.s = NestedWithDefaults{
            b: null
        };
    }
}