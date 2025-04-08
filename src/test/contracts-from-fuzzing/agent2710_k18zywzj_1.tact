struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStruct {
    data: Inner;

    init() {
        self.data = Inner{ a: 42, b: true };
    }
}