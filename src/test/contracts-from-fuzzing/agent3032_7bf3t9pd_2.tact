struct DeepNest {
    lvl1: Int;
    lvl2: Nested;
}

struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract Test {
    d: DeepNest;

    init() {
        self.d = DeepNest{
            lvl1: 1,
            lvl2: Nested{
                x: 2,
                y: true,
                z: "ok",
            },
        };
    }
}