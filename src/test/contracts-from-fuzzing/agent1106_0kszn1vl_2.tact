struct NestedStruct {
    innerInt: Int;
    optionalBool: Bool?;
}

contract NestedStructStorage {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ innerInt: 5, optionalBool: null };
    }
}