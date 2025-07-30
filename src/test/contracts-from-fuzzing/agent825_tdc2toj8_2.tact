struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStructTest {
    data: Nested;

    init() {
        self.data = Nested{
            x: 123,
            y: true,
            z: "abc",
        };
    }
}