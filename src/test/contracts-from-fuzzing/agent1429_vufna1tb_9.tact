struct Nested {
    x: Int;
    y: Int;
}

contract InlineDefault {
    data: Nested = Nested{ x: 10, y: 20 };

    init() {
        self.data = Nested{ x: 5, y: 6 };
    }
}