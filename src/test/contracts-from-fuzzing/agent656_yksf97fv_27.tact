struct Leaf {
    v: Int;
}

struct Middle {
    l: Leaf;
    another: String;
}

struct Top {
    left: Middle?;
    right: Middle?;
    flag: Bool;
}

contract TreeOptions(
    root: Top?,
    ready: Bool,
    index: Int,
) {
}