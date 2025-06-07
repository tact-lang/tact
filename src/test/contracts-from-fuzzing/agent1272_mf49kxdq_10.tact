struct SerializeMix {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint120;
    d: Int;
}

contract SerializeMixContract {
    storage: SerializeMix;

    init() {
        self.storage = SerializeMix{
            a: -123456,
            b: 10,
            c: 1000000,
            d: 42
        };
    }
}