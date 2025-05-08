struct Bottom {
    z: Int;
    w: String?;
}

struct Mid {
    midVal: Bool;
    bottom: Bottom;
}

struct Top {
    x: Int;
    mid: Mid;
}

contract TestContract(topData: Top) {}
