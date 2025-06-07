struct Leaf {
    x: Int = 1;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    mid: Middle?;
}

contract DeepOptionalChain {
    root: Root?;
}