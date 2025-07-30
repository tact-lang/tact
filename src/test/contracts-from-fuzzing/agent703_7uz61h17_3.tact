struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFieldsTest {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            foo: null,
            bar: true,
            baz: null
        };
    }
}