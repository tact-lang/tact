struct Nested {
    x: Int?;
    y: Bool?;
}

contract StructPersist {
    field: Nested;

    init() {
        self.field = Nested{
            x: 10,
            y: null,
        };
    }

    receive() {}
}