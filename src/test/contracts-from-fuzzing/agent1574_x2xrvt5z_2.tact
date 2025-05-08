struct Nested {
    x: Int;
    y: Bool;
}

contract NestedStruct {
    data: Nested;

    init() {
        self.data = Nested{ x: 5, y: true };
    }
}