struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{
            x: 123,
            y: true,
            z: "abc",
        };
    }
}