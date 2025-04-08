struct SOptInner {
    f: Int?;
}

struct SNested {
    a: SOptInner?;
    b: SOptInner?;
    c: SOptInner?;
}

contract TestOptNest {
    ff: SNested;

    init() {
        self.ff = SNested{
            a: null,
            b: null,
            c: null
        };
    }
}