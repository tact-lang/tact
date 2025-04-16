struct Mid {
    a: Int;
    b: String;
}

struct Top {
    x: Bool;
    y: Mid;
    z: Mid?;
    s: String;
    opt: Bool?;
    num: Int as uint32;
}

contract Combined {
    storage: Top;
    init() {
        self.storage = Top{
            x: true,
            y: Mid{ a: 1, b: "A" },
            z: null,
            s: "Hello",
            opt: false,
            num: 123,
        };
    }
}