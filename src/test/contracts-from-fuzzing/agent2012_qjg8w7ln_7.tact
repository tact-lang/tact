struct Inner {
    x: Int;
    y: Bool;
}

contract DefaultFieldValues {
    nested: Inner = Inner{ x: 5, y: true };

    init() {
        self.nested = Inner{ x: 10, y: false };
    }
}