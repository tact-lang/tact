struct Nested {
    innerFlag: Bool;
    number: Int;
}

contract NestedStructStorage {
    data: Nested;

    init() {
        self.data = Nested{
            innerFlag: false,
            number: 123
        };
    }
}