struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedField: NestedStruct;

    init() {
        self.nestedField = NestedStruct { a: 5, b: true };
    }
}