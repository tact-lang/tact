struct Outer {
    mid: Mid?;
}

struct Mid {
    inner: InnerMost?;
}

struct InnerMost {
    v: Int?;
}

contract AllOptDeep {
    data: Outer = Outer{ mid: null };
}