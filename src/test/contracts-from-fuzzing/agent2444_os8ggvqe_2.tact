struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStorage {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            x: 42,
            y: true,
            z: "nested"
        };
    }
}
