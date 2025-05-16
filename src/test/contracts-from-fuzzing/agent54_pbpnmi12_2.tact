struct Nested {
    innerVal: Int;
}

contract WithNestedStruct {
    n: Nested;

    init() {
        self.n = Nested{ innerVal: 123 };
    }
}