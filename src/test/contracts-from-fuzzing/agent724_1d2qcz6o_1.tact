struct NestedStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    foo: NestedStruct;

    init() {
        self.foo = NestedStruct{ x: 1, y: null };
    }
}