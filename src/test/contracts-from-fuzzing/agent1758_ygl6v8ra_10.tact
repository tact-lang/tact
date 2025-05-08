struct OptionalInner {
    z: Int?;
}

struct OptionalOuter {
    in1: OptionalInner?;
    in2: OptionalInner?;
}

contract OptionalDeep {
    oo: OptionalOuter;

    init() {
        self.oo = OptionalOuter {
            in1: null,
            in2: OptionalInner { z: null }
        };
    }
}