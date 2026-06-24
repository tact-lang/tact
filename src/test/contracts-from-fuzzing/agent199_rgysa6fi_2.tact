struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStructStorage {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            foo: 1,
            bar: true,
            baz: "hello",
        };
    }
}
