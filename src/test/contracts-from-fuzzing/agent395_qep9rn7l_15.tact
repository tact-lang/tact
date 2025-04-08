struct Inner1 {
    p: Int?;
    q: String?;
}

struct Inner2 {
    x: Bool?;
    y: Int?;
    z: Cell?;
}

struct OuterComplexOpt {
    i1: Inner1?;
    i2: Inner2?;
}

contract DeepOptionalMix {
    val: OuterComplexOpt;

    init() {
        self.val = OuterComplexOpt{
            i1: Inner1{ p: null, q: null },
            i2: null
        };
    }
}
