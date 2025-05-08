struct Nested {
    first: Int;
    mid: Int?;
    last: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            first: 11,
            mid: null,
            last: true
        };
    }
}
