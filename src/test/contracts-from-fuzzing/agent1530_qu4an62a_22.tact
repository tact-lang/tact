struct SInner {
    a: Int;
}

struct SOuter {
    i: SInner;
    s: String;
    b: Bool;
}

contract MixedFlatten {
    data: SOuter;

    init() {
        self.data = SOuter{
            i: SInner{a: 10},
            s: "hi",
            b: true
        };
    }
}