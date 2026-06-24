struct NestedStruct {
    a: Int;
    b: Int?;
}

contract TestContract {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ a: 1, b: 2 };
    }
}