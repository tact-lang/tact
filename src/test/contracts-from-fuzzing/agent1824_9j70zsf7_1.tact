struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract WithNestedStruct {
    nested: Nested;

    init() {
        self.nested = Nested{ x: 1, y: true, z: "ok" };
    }
}
