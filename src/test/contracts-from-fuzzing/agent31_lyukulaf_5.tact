struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructTest {
    persisted: OptStruct;

    init() {
        self.persisted = OptStruct{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}
