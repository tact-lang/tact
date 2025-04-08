struct NestedStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract DeepNested {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            foo: 1,
            bar: true,
            baz: "test"
        };
    }
}