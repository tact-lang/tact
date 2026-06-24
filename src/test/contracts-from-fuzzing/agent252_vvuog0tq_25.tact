struct Base {
    x: Int;
}

struct Mid {
    baseVal: Base;
    optBase: Base?;
}

struct Top {
    midVal: Mid;
    optMid: Mid?;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top {
            midVal: Mid {
                baseVal: Base{ x: 1 },
                optBase: null
            },
            optMid: null
        };
    }
}