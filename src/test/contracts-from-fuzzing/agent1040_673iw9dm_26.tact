struct OptDefaults {
    foo: String? = "bar";
    baz: Int;
}

contract TestContract {
    persist: OptDefaults;

    init() {
        self.persist = OptDefaults{
            baz: 100
        };
    }
}