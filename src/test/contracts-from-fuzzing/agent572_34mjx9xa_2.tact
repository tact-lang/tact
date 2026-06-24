struct Nested {
    x: Int = 1;
    y: Bool = true;
    z: String?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            x: 42,
            y: false,
            z: "hello"
        };
    }
}