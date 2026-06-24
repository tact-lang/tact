struct Inner {
    x: Int;
    y: Bool;
}

contract ArrayStructs {
    first: Inner;
    second: Inner;
    third: Inner;

    init() {
        self.first = Inner{ x: 1, y: true };
        self.second = Inner{ x: 2, y: false };
        self.third = Inner{ x: 3, y: true };
    }
}