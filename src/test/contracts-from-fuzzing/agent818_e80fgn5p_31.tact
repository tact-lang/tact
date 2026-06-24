struct WideNested {
    a: Bool;
    b: Nested;
    c: Bool;
}

struct Nested {
    x: Int;
    y: String;
    z: Bool?;
}

contract WideNest {
    state: WideNested;

    init() {
        self.state = WideNested{
            a: true,
            b: Nested{
                x: 42,
                y: "abc",
                z: null
            },
            c: false
        };
    }
}