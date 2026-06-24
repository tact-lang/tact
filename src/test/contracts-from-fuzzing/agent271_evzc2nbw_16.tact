struct MixNestDefaultOpt {
    a: Int = 1;
    b: Bool?;
    c: InnerMix;
}

struct InnerMix {
    s: String = "x";
    addr: Address?;
}

contract MixNestDefaultOptTest {
    s: MixNestDefaultOpt;

    init() {
        self.s = MixNestDefaultOpt{ b: null, c: InnerMix{ s: "x", addr: null } };
    }
}
