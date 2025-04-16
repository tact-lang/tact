struct Nested {
    x: Int;
    y: Bool;
    s: String;
}

contract NestedStructTest {
    data: Nested;

    init() {
        self.data = Nested{
            x: 42,
            y: true,
            s: "test",
        };
    }
}