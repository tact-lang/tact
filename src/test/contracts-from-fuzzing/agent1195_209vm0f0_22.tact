struct HasSerialization {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int128;
}

contract SerializeVars {
    f: HasSerialization;

    init() {
        self.f = HasSerialization{ a: 1, b: 2, c: 3 };
    }
}
