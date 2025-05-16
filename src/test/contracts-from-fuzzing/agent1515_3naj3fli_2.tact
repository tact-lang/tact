struct NestedStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract UsesNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            foo: 0,
            bar: false,
            baz: "",
        };
    }
}