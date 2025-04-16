struct Inner {
    a: Int;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract DoubleLayerNested {
    state: Outer = Outer{
        mid1: Middle{ inner1: Inner{a:1}, inner2: Inner{a:2} },
        mid2: Middle{ inner1: Inner{a:3}, inner2: Inner{a:4} },
    };
}