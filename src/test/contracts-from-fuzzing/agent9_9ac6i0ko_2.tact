struct NestedStruct {
    a: Int;
    b: Bool;
}

contract NestedFieldContract {
    nested: NestedStruct = NestedStruct{ a: 1, b: true };

    init() {
        self.nested = NestedStruct{ a: 42, b: false };
    }
}