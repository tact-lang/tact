struct ConstDefaults {
    foo: Int = 42;
    bar: Bool = false;
}

contract OverrideDefaults {
    vals: ConstDefaults;

    init() {
        self.vals = ConstDefaults { foo: 10, bar: true };
    }

    receive() {
        let _ = self.vals.foo;
    }
}