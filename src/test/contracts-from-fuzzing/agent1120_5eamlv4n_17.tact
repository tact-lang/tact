struct MaxBits {
    num: Int as int257;
    unum: Int as uint256;
}

contract BitWidths {
    d: MaxBits;

    init() {
        self.d = MaxBits{
            num: 123,
            unum: 456,
        };
    }
}