struct Sizes {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int; // default int257
}

contract SerialTest {
    s: Sizes = Sizes{
        a: 1,
        b: 2,
        c: 3,
        d: 4,
        e: 5,
    };
    init() {}
}