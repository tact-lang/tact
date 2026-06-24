struct Inner {
    x: Int?;
    y: Bool?;
}

struct Mid {
    nested: Inner?;
    s: String?;
}

struct Outer {
    m: Mid?;
    flag: Bool;
}

contract NullLayers {
    outer: Outer;
    init() {
        self.outer = Outer{ m: null, flag: true };
    }
}