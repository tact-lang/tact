struct Nested {
    x: Int;
    y: Int;
    z: Bool?;
}

contract NestedStruct {
    s: Nested;

    init() {
        self.s = Nested{ x: 10, y: 20, z: null };
    }
}