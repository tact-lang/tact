struct Nested {
    a: Int;
    b: Int;
}

contract NestedStorage {
    data: Nested;

    init() {
        self.data = Nested{
            a: 10,
            b: 20,
        };
    }
}