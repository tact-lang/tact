struct Nested {
    x: Int = 10;
    y: Bool = false;
    z: String = "hello";
}

contract Test {
    nested: Nested = Nested{};

    receive() {
        self.nested = Nested{
            x: 42,
            y: true,
            z: "world",
        };
    }
}