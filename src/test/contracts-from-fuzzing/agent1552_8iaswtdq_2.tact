struct Deep {
    a: Int;
    b: String;
    c: Bool;
}

struct Middle {
    x: Deep;
    y: String;
    z: Bool?;
}

struct Top {
    m: Middle;
    s: String;
}

contract DeepNest {
    val: Top;

    init() {
        self.val = Top{
            m: Middle{
                x: Deep{a: 1, b: "x", c: false},
                y: "y",
                z: null,
            },
            s: "s",
        };
    }
}