struct Leaf {
    x: Int;
}

struct Mid {
    l: Leaf;
}

struct Top {
    m: Mid;
}

contract TestContract {
    maybe: Top?;
}