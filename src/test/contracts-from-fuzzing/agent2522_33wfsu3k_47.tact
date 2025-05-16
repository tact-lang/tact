contract TestUintInt {
    smallInt: Int as int8 = -128;
    smallUint: Int as uint8 = 255;
    midInt: Int as int16 = -32768;
    midUint: Int as uint16 = 65535;
    bigInt: Int as int64 = -9223372036854775808;
    bigUint: Int as uint64 = 18446744073709551615;

    init() {}
}