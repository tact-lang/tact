struct Leaf {
    n: Int?;
    m: Bool = false;
}

struct Mid {
    val: Leaf?;
    other: Int = 42;
}

contract DeepOpt {
    f: Mid = Mid{};
}