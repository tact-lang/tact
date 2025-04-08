struct Nested {
    value: Int;
    flag: Bool?;
}

contract TestStore {
    data: Nested;

    init() {
        self.data = Nested{
            value: 123,
            flag: true,
        };
    }
}