struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract TestNested {
    nested: Nested;

    init() {
        self.nested = Nested{ x: 10, y: false, z: "nested" };
    }
}