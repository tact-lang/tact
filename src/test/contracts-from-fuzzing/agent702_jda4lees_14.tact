struct Leaf {
    x: Int;
}

struct Mid {
    leafOpt: Leaf?; // no default
}

struct Top {
    mid: Mid; // not optional
}

contract EnforceDeep {
    top: Top = Top{mid: Mid{}};
    init() {}
}