struct InnerMost {
    x: Int;
}

struct Mid {
    y: InnerMost;
}

struct Outer {
    z: Mid;
}

contract UltraDeepParam(
    v: Outer,
    txt: String,
    num: Int
) {}
