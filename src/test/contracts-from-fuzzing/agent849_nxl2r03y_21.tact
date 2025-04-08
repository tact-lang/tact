struct BitWidthEdge {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;
    d: Int as uint256;
}

contract TestContract {
    data: BitWidthEdge;

    init() {
        self.data = BitWidthEdge{
            a: -1,
            b: 1,
            c: 0,
            d: 0
        };
    }
}