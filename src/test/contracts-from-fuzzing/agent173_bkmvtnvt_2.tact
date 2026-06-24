struct Inner {
    x: Int;
    y: Int?;
}

contract TestNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{ x: 5, y: 7 };
    }
}