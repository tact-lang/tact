struct SomeData {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalInStruct {
    content: SomeData;

    init() {
        self.content = SomeData{
            foo: null,
            bar: true,
            baz: null
        };
    }
}