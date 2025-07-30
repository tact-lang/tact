struct ChainEnd {
    val: Int;
}

struct ChainMid {
    next: ChainEnd?;
    msg: String;
}

struct ChainStart {
    next: ChainMid?;
    flag: Bool;
}

contract OptionChainFin(
    root: ChainStart?,
    active: Bool,
    label: String?,
) {}
