struct S {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
}

contract SerializationStruct {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: 2,
            c: 3
        };
    }
}