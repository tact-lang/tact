struct OpTop {
    a: Int?;
    mid: OpMid?;
}

struct OpMid {
    b: Int?;
    leaf: OpLeaf?;
}

struct OpLeaf {
    c: Int;
}

contract OptionalLadder {
    data: OpTop;

    init() {
        self.data = OpTop{
            a: null,
            mid: OpMid{
                b: null,
                leaf: null
            }
        };
    }
}
