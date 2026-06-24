struct NestedStruct {
    foo: Int;
    bar: Bool;
    text: String;
}

contract TestNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            foo: 1,
            bar: true,
            text: "hello"
        };
    }
}