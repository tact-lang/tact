struct ManyInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int as int257;
}

contract IntWidths {
    ints: ManyInts;

    init() {
        self.ints = ManyInts{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6
        };
    }
}