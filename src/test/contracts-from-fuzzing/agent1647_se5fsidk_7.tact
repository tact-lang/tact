struct OptionalDef {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
}

contract TestContract {
    data: OptionalDef;
    init() {
        self.data = OptionalDef{};
    }
    receive() {}
}