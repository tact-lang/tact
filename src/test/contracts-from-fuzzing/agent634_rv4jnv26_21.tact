// Contract with Int fields having large positive and negative ranges
contract IntEdges {
    pos: Int = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    neg: Int = -0x800000000000000000000000000000000000000000000000000000000000000;

    init() {
        // keep defaults
    }
}