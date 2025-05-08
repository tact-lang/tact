struct HasDefaults {
    foo: Int = 42;
    bar: Bool = true;
    baz: Address? = null;
}

contract TestContract {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}