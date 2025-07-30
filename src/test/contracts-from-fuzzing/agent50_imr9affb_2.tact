struct Nested {
    x: Int;
    y: Bool;
    z: Int?;
    s: String;
}

contract HasNested {
    data: Nested;

    init() {
        self.data = Nested{
            x: 42,
            y: true,
            z: null,
            s: "hi",
        };
    }
}