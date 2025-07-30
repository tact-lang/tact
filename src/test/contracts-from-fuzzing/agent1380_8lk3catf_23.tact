struct WithSerialization {
    a: Int as int8;
    b: Int as uint16;
    c: Int as coins;
    d: Int;
    e: Int as uint64;
    f: Int as int32;
}

contract SerializedVars {
    val: WithSerialization;

    init() {
        self.val = WithSerialization{
            a: -5,
            b: 500,
            c: ton("1"),
            d: 123,
            e: 9876543210,
            f: -12345
        };
    }
}