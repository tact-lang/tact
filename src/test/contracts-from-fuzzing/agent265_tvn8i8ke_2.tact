struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    n: Nested;
    z: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{
                x: 5,
                y: false,
            },
            z: "test",
        };
    }
}