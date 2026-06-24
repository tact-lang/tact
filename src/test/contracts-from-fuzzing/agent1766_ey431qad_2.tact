struct NestedPrimitive {
    flag: Bool;
    count: Int;
}

contract FieldWithNestedStruct {
    nested: NestedPrimitive;

    init() {
        self.nested = NestedPrimitive{
            flag: true,
            count: 7,
        };
    }
}
