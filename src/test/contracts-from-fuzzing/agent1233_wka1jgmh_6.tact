struct Nested {
    a: Int;
    b: Bool?;
    c: String = "default";
}

contract StructInStorage {
    nested: Nested;

    init() {
        self.nested = Nested{a: 1, b: null, c: "abc"};
    }
}