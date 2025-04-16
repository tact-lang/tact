struct Leaf { 
    x: Int;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract NestedWrap {
    d: Top;

    init() {
        self.d = Top{ mid: Mid{ leaf: Leaf{ x:99 } } };
    }
}