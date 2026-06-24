struct Nested {
    x: Int;
    y: Int?;
}

contract NestedStruct {
    s: Nested;

    init() {
        self.s = Nested{ x: 10, y: null };
    }
}