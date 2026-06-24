struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStructTest {
    st: OptionalStruct;

    init() {
        self.st = OptionalStruct {
            foo: null,
            bar: null,
            baz: null
        };
    }
}
