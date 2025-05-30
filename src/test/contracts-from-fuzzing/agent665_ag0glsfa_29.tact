struct NestedWithDefaults {
    a: Int = 1;
    b: Bool? = null;
}

contract NestedFieldsWithDefaults {
    x: NestedWithDefaults = NestedWithDefaults{};

    init() {
        self.x = self.x;
    }

    receive() {
        let _ = self.x;
    }
}