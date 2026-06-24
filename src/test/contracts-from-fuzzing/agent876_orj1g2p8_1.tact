struct InnerStruct {
    innerField: Bool;
}

contract NestedStructStorage {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ innerField: true };
    }
}