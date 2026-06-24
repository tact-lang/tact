struct Nested {
    val1: Int;
    val2: Int?;
}

contract Test {
    field1: Int;
    field2: Nested;

    init() {
        self.field1 = 1;
        self.field2 = Nested{val1: 2, val2: null};
    }
}