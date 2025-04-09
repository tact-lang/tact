struct Max256Bits {
    x: Int as int256;
    y: Int as uint256;
}

contract Test {
    val: Max256Bits;

    init() {
        self.val = Max256Bits{
            x: -123456789123456789123456789123456789123456789,
            y: 123456789123456789123456789123456789123456789
        };
    }
}