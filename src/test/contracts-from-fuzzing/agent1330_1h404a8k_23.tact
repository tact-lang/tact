contract ConstRangeFail {
    small: Int as uint8 = 300; // invalid constant out-of-bounds

    receive() {}
}
