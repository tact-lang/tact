struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract NestedStructContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{
            foo: 1,
            bar: true,
            baz: "hello",
        };
    }
}