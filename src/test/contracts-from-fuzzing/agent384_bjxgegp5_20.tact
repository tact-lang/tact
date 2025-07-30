struct MaxBitsInt {
    small: Int as uint8;
    medium: Int as uint32;
    big: Int as uint256;
}

contract MaxBitsContract {
    storage: MaxBitsInt = MaxBitsInt{
        small: 255,
        medium: 4294967295,
        big: 115792089237316195423570985008687907853269984665640564039457584007913129639935
    };

    init() {
        self.storage.medium = 123456;
    }
}