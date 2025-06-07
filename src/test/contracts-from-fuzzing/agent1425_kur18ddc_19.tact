struct BitMix {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;
    d: Int as uint256;
    e: Bool;
}

contract BitsDemo {
    bits: BitMix;

    init() {
        self.bits = BitMix{
            a: 1,
            b: 1,
            c: 1234567890,
            d: 9876543210,
            e: true
        };
    }

    receive() {}
}