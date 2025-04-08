struct Low {
    a: Int;
}

struct Mid {
    low: Low;
    b: String;
}

struct Top {
    mid: Mid;
    c: Bool;
}

contract DirectNest(
    nested: Top?,
    index: Int,
) {}
