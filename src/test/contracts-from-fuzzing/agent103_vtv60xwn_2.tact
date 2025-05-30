struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    first: Nested;
    second: Int?;
}

contract Test {
    obj: Outer;

    init() {
        self.obj = Outer{
            first: Nested{x: 5, y: null, z: "hi"},
            second: null
        };
    }
}