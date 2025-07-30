struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract WithNestedStruct {
    data: Nested;

    init() {
        self.data = Nested{inner1: 123, inner2: true};
    }
}