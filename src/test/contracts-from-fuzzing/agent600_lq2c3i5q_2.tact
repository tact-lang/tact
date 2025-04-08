struct NestedStruct {
    foo: Int;
    bar: Bool;
}

contract StructAsField {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{foo: 1, bar: false};
    }
}