struct Inner {
    u: Int as uint32;
    s: Int as int64;
    short: Int as int8;
    coin: Int as coins;
}

contract SerializationTest {
    inner: Inner;

    init() {
        self.inner = Inner{
            u: 123,
            s: -456,
            short: 7,
            coin: ton("1"),
        };
    }
}