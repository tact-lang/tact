struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract DeepChain {
    t: Top;

    init() {
        self.t = Top{ mid: Mid{ leaf: Leaf{ val: 5 } }};
    }
}