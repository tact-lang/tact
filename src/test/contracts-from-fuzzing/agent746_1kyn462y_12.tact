struct Sizes {
    a: Int as int4;
    b: Int as uint7;
    c: Int as int13;
    d: Int as uint33;
    e: Int as int128;
    f: Int as uint256;
}

struct SizesWrapper {
    s: Sizes;
    flag: Bool;
}

contract MixedSizes {
    data: SizesWrapper;

    init() {
        self.data = SizesWrapper{
            s: Sizes{
                a: -3,
                b: 50,
                c: -1234,
                d: 123456789,
                e: -1234567890123456789012345,
                f: 1234567890123456789012345678901234567890
            },
            flag: true
        };
    }
}