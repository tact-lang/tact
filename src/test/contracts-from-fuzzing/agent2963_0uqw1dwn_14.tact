struct Deeply {
    a: Int;
    b: String;
    c: Bool;
}

struct Mid {
    d: Int;
    e: Deeply;
    f: Bool?;
}

contract NestedLayers {
    x: Mid;

    init() {
        self.x = Mid{
            d: 7,
            e: Deeply{
                a: 1,
                b: "hey",
                c: true
            },
            f: null
        };
    }
}
