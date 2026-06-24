struct Deep {
    a: Int as uint8;
    b: Int as int16;
}

struct Mid {
    d: Deep;
    flag: Bool;
}

struct Top {
    mid: Mid;
    name: String;
}

contract Test(
    saved: Top,
) {}