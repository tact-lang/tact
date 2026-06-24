struct Leaf {
    value: Int;
}

struct Middle {
    leafOpt: Leaf?;
}

struct Top {
    mid: Middle;
    label: String;
}

contract TestContract(
    param: Top,
) {}