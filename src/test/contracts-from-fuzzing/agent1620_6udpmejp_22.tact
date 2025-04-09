struct SInner {
    v: Int;
}

struct SOuter {
    x: Int;
    y: SInner?;
}

contract DeepOptionalInner {
    s: SOuter;

    init() {
        self.s = SOuter{
            x: 3,
            y: SInner{ v: 7 }
        };
    }
}