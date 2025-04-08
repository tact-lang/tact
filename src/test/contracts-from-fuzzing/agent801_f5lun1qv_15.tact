struct OptionalAndDefaults {
    foo: Int = 0;
    bar: Int?;
    baz: Bool = false;
}

contract OptionalDefaultStorage {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{
            bar: 99
        };
    }
}