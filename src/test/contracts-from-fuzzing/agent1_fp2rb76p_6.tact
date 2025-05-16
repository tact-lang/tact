struct NumberWrapper {
    small: Int as uint4;
    mid: Int as int64;
    large: Int as uint128;
}

contract TestContract {
    w: NumberWrapper = NumberWrapper{
        small: 3,
        mid: -50000,
        large: 1234567890123456789012345
    };
    init() {}
}