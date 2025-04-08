struct OptionalDefaults {
    foo: Int? = null;
}

contract Test {
    o: OptionalDefaults;

    init() {
        self.o = OptionalDefaults{};
    }
}