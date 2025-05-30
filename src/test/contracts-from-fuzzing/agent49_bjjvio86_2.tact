struct Nested {
    y: Int;
    flag: Bool;
}

contract WithNestedStruct {
    data: Nested;

    init() {
        self.data = Nested{
            y: 10,
            flag: true,
        };
    }
}
