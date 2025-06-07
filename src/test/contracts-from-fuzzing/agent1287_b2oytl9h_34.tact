struct MixedSerialized {
    a: Int as uint4 = 1;
    b: Int as int8 = -8;
    c: Int as uint16 = 255;
    d: Int as uint32 = 1_000_000;
    e: Int as int64 = -64;
    f: Int as uint128 = 123456789;
    g: Int as int257 = 42;
}

contract LargeMixedSerialized {
    s: MixedSerialized = MixedSerialized{};
}