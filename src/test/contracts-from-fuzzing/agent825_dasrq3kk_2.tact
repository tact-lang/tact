struct Nested {
    x: Int?;
    y: Bool?;
}

contract Test {
    item: Nested;

    init() {
        self.item = Nested{
            x: null,
            y: true,
        };
    }
}