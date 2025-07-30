struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Nested;
    z: Nested?;
}

contract Test {
    data: Outer = Outer{
        x: 1,
        y: Nested{a: 2, b: true},
        z: null
    };

    init() {
        self.data = Outer{
            x: 10,
            y: Nested{a: 20, b: false},
            z: Nested{a: 30, b: true}
        };
    }
}