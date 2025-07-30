struct NestedStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ x: 1, y: null };
    }
}
