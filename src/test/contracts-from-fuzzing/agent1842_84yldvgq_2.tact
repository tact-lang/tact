struct Nested {
    number: Int;
    flag: Bool;
}

contract StructField {
    data: Nested;

    init() {
        self.data = Nested{
            number: 123,
            flag: true,
        };
    }
}