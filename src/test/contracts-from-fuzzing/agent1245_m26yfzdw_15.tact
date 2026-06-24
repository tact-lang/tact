struct SChild {
    foo: Int;
    opt: Bool?;
}

struct SParent {
    a: SChild;
    b: Int?;
}

contract OptMix {
    s: SParent;

    init() {
        self.s = SParent{
            a: SChild{ foo: 1, opt: null },
            b: null,
        };
    }
}
