struct SInner {
    v1: Int;
    v2: Bool;
}

struct SOuter {
    in1: SInner;
    in2: SInner;
    in3: SInner;
}

contract TestContract {
    large: SOuter?;

    init() {
        self.large = SOuter{
            in1: SInner{ v1: 1, v2: true },
            in2: SInner{ v1: 2, v2: false },
            in3: SInner{ v1: 3, v2: true },
        };
    }
}