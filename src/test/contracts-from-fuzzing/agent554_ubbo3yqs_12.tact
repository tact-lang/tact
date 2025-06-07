struct S1 {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int8;
}

contract SerializationVariants {
    s: S1;

    init() {
        self.s = S1{
            a: 5,
            b: -3,
            c: 200,
            d: -100
        };
    }
}