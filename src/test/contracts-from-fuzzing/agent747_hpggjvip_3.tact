struct Nested {
    x: Int?;
    y: Bool?;
    text: String?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested {
            x: null,
            y: true,
            text: null,
        };
    }
}