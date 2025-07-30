struct Nested {
    value: Int;
    flag: Bool;
}

contract TestStorage {
    point: Nested;

    init() {
        self.point = Nested{
            value: 123,
            flag: true
        };
    }
}