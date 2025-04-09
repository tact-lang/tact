struct Bar {
    x: Int;
    y: Bool;
}

contract Test {
    bar: Bar = Bar{ x: 5, y: true };

    init() {
        self.bar = Bar{ x: 6, y: false };
    }
}