struct DeepLeaf {
    n: Int?;
}

struct Middle {
    s: String?;
    d: DeepLeaf?;
}

struct Top {
    m: Middle?;
}

contract DeepDeepOptional {
    t: Top?;
}