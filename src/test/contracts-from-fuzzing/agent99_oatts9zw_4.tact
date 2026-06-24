struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract StorageTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: true,
            baz: "hi"
        };
    }
}