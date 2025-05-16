struct SerialFormats {
    a: Int as uint1 = 1;
    b: Int as int16 = -10;
    c: Int as uint32 = 30000;
    d: Int as int64 = -9999;
    e: Int as uint256 = 123456789;
    f: Int as int257 = -123456789;
}

contract SerialFormatsTest {
    s: SerialFormats = SerialFormats{};
}