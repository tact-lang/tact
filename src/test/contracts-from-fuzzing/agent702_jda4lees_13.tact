struct Leaf {
    x: Int;
}

struct Mid {
    leafOpt: Leaf?; // no default
}

struct Top {
    midOpt: Mid? = null; // defaulted only outer optional
}

contract PartialNestedDefaults {
    top: Top = Top{};
    init() {}
}