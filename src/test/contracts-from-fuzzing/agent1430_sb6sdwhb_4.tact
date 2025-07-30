struct Nested {
    x: Int;
    y: Bool;
    z: String = "hello";
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{
            x: 1,
            y: true,
            z: "world",
        };
    }
}
