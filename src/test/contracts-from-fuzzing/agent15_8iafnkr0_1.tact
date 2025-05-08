struct Nested {
    inner: Int;
}

contract Test {
    field1: Int;
    field2: Nested;
    
    init() {
        self.field1 = 1;
        self.field2 = Nested{ inner: 2 };
    }
}