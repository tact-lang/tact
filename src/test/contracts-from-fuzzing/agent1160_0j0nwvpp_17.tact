struct Deep {
    value: Int;
    sub: Int?;
}

struct Mid {
    deep: Deep;
    optDeep: Deep?;
}

struct Top {
    mid: Mid;
    optMid: Mid?;
}

contract MixedDepth {
    store: Top;

    init() {
        self.store = Top{
            mid: Mid{
                deep: Deep{value:1, sub:2},
                optDeep: null
            },
            optMid: null
        };
    }
}