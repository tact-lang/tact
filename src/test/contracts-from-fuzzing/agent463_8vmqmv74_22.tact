struct VarIntSizes {
    a: Int as uint3;
    b: Int as int10;
    c: Int as uint64;
    d: Int as int1;
    e: Int as uint256;
}

contract VarIntCont {
    packed: VarIntSizes;

    init() {
        self.packed = VarIntSizes{
            a: 3, b: -5, c: 1234567890, d: -1, e: 12345678901234567890
        };
    }
}