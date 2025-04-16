struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructTest {
    st: OptStruct;

    init() {
        self.st = OptStruct{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}