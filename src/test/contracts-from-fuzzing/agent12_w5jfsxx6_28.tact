struct Leaf {
    x: Int?;
}

struct Middle {
    y: String?;
    leaf: Leaf?;
}

contract OptionalStructMix {
    m: Middle?;
}