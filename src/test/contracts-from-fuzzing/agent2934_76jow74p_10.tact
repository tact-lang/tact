struct S {
    a: Int as int32;
    b: Int as uint32;
    c: Int as int64;
    d: Bool;
    e: Bool;
}

contract SerializationSpecFields {
    s: S;

    init() {
        self.s = S{
            a: -123,
            b: 456,
            c: -789,
            d: true,
            e: false,
        };
    }
}