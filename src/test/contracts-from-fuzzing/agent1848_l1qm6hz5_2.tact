struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    alpha: Int;
    beta: Nested;
    gamma: Bool;
}

contract TestDeep {
    data: Outer;

    init() {
        self.data = Outer{
            alpha: 5,
            beta: Nested{
                x: 7,
                y: null,
                z: "deep"
            },
            gamma: false
        };
    }
}