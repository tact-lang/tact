struct NestedStruct {
    innerOptional: Bool?;
    deepOptional: Int?;
}

contract DeepOptionals {
    nested: NestedStruct?;
    deepField: Int?;

    init() {
        self.nested = null;
        self.deepField = null;
    }
}