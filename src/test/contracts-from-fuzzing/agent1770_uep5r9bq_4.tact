struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalNestedStruct {
    item: Inner?;

    init() {
        self.item = Inner{ x: 42, y: true };
    }
}