struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ innerInt: 1, innerBool: true };
    }
}