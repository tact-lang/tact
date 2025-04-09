struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptTest {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}
