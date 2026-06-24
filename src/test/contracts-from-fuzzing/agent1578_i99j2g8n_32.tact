struct InnerMost {
    x: Int as uint8;
    flag: Bool?;
}

struct Inner {
    item: InnerMost?;
    txt: String?;
}

struct Mid {
    lev: Inner?;
    count: Int as uint32;
}

struct Outer {
    mid: Mid?;
    active: Bool;
}

contract DeepParams(
    param: Outer,
) {}