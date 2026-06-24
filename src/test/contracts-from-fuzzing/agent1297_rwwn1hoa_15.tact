struct DeepInner {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int;
}

struct DeepMiddle {
    inner: DeepInner;
}

struct DeepOuter {
    middle: DeepMiddle;
}

contract SerialNested {
    s: DeepOuter = DeepOuter{
        middle: DeepMiddle{
            inner: DeepInner{
                a: 2,
                b: -4,
                c: 100,
                d: 500,
            },
        },
    };
    init() {}
}