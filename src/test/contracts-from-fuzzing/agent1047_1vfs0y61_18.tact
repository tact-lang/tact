struct BigInner {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Wrap {
    w: BigInner;
    v: Int;
}

contract Test {
    st: Wrap;

    init() {
        self.st = Wrap{
            w: BigInner{
                a: 1,
                b: 2,
                c: 3,
                d: 4,
                e: 5
            },
            v: 10
        };
    }
}