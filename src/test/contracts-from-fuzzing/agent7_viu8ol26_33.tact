// complex combo: nested struct holding many optionals, nested again
struct InnerMost {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Mid {
    im: InnerMost?;
}

struct Top {
    m: Mid?;
    x: Int;
}

contract NestedFlood {
    t: Top;

    init() {
        self.t = Top{
            m: Mid{ im: null },
            x: 100,
        };
    }
}
