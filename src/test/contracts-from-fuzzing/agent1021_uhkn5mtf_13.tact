// Large nested struct chain
struct Leaf {
    endVal: Int;
}

struct Mid {
    next: Leaf;
}

struct Root {
    child: Mid;
}

contract DeepChain {
    root: Root = Root{
        child: Mid{
            next: Leaf{ endVal: 42 },
        },
    };
}