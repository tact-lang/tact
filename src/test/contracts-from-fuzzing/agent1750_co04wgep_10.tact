struct Leaf {
    val: Int as uint32;
}

struct Mid {
    leaf: Leaf?;
    num: Int as uint64;
}

struct Top {
    mid: Mid?;
    high: Int as uint8;
}

contract TestContract {
    t: Top = Top{
        mid: null,
        high: 7,
    };

    init() {}
}