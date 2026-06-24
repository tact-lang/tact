struct InnerD {
    d: Int;
    e: Bool;
}

struct MiddleC {
    c: InnerD;
    f: Bool;
}

struct OuterB {
    b: MiddleC;
    g: Int;
}

contract DeeplyNested {
    state: OuterB = OuterB{
        b: MiddleC{
            c: InnerD{
                d: 10,
                e: true
            },
            f: false
        },
        g: 5
    };

    init() {}
}