struct OptionalDefaults {
    foo: Int? = null;
    bar: String? = null;
    baz: Bool? = null;
}

contract TestContract {
    val: OptionalDefaults;
    init() {
        self.val = OptionalDefaults{};
    }
}