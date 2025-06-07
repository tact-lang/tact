struct NonTrivSerialization {
    a: Int as coins;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint1;
}

contract SerializationContract {
    val: NonTrivSerialization;

    init() {
        self.val = NonTrivSerialization{
            a: 1000000000,
            b: 1234567,
            c: -1234567,
            d:1,
        };
    }
}