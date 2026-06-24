struct Combo {
    optInner: Inner?;
    normInner: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    c: Combo = Combo{
        optInner: null,
        normInner: Inner{ x:7, y:8 }
    };
}