struct NestedStruct {
    nested: Inner;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ nested: Inner{ value: 5 } };
    }
}