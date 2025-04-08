struct FinalNest {
    inner1: Int;
    inner2: Bool;
}

struct MidNest {
    prev: FinalNest?;
}

struct TopNest {
    middle: MidNest?;
}

contract FinalOptNest {
    v: TopNest? = null;
    init() {}
}