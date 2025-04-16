struct LeafBits {
    num: Int as uint32;
}

struct MiddleBits {
    leaf: LeafBits;
}

struct OuterBits {
    mid: MiddleBits;
    flag: Bool;
}

contract Test11 {
    x: OuterBits;

    init() {
        self.x = OuterBits{
            mid: MiddleBits{
                leaf: LeafBits{num: 12345}
            },
            flag: false,
        };
    }

    receive() {}
}