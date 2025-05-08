struct Leaf {
    data: Int?;
}

struct Mid {
    leaves: map<Int, Leaf>;
}

struct Top {
    mid: Mid;
}

contract Test {
    nested: Top?;
}
