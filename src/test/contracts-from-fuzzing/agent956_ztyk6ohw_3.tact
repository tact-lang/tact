struct Inner {
    a: Int;
    b: Bool;
}

contract SingleNestedStruct {
    data: Inner;
    init() {
        self.data = Inner{ a: 5, b: true };
    }
}
