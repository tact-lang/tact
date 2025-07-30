struct MultiSerialize {
    a: Int as uint4;
    b: Int as uint32;
    c: Int as int64;
    d: Int as int128;
}

contract SerializeAll {
    data: MultiSerialize;

    init() {
        self.data = MultiSerialize{
            a: 3,
            b: 65536,
            c: -1000,
            d: 12345678
        };
    }
}