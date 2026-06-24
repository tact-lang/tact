struct Sublevel {
    active: Bool;
    label: String;
}

struct Midlevel {
    count: Int;
    sub: Sublevel;
}

struct Top {
    mid: Midlevel;
    tag: String;
}

contract DoubleDepth {
    payload: Top;

    init() {
        self.payload = Top{
            mid: Midlevel{
                count: 7,
                sub: Sublevel{
                    active: false,
                    label: "deep"
                }
            },
            tag: "yay"
        };
    }
}