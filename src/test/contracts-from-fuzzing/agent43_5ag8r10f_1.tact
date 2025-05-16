struct Inner {
    x: Int;
    y: Int;
}

contract TestNestedStruct {
    point: Inner;

    init() {
        self.point = Inner{ x: 5, y: 10 };
    }
}