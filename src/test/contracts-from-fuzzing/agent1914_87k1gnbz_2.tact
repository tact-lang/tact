struct NestedStruct {
    inner: SimpleStruct;
}

struct SimpleStruct {
    x: Int;
}

contract TestContract {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ inner: SimpleStruct{ x: 42 } };
    }
}