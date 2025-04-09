struct Nested {
    flag: Bool;
    value: Int?;
}

contract ComplexStorage {
    data: Nested;

    init() {
        self.data = Nested{
            flag: true,
            value: null,
        };
    }
}