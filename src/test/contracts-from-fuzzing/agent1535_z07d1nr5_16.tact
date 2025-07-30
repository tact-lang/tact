struct SzMix {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int; // default int257
}

contract PersistSzMix {
    data: SzMix = SzMix{
        a: 1,
        b: 255,
        c: 65536,
        d: 123456789,
        e: 123456789123456789,
        f: -42,
    };
}
