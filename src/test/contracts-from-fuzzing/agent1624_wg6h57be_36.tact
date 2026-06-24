struct BoundaryInts {
    small: Int as uint1;
    big: Int as uint256;
}

contract SerializationEdges {
    data: BoundaryInts;

    init() {
        self.data = BoundaryInts{
            small: 1,
            big: 115792089237316195423570985008687907853269984665640564039457584007913129639935,
        };
    }
}