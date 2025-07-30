struct Leaf {
    foo: Int?;
    yes: Bool = true;
}

struct Mid {
    leaf: Leaf;
    s: String;
}

struct Top {
    m: Mid?;
    bar: Int = 5;
}

contract AggroParams(
    data: Top
) {}