struct Inner {
    x: Int;
}

contract OptionalStructInside {
    data: Inner?;

    init() {
        self.data = Inner{ x: 42 };
    }
}