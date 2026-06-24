struct SerializeOpts {
    a: Int as uint3;
    b: Int as int4;
    c: Int as uint64;
}

contract SerializeStruct {
    s: SerializeOpts;

    init() {
        self.s = SerializeOpts{
            a: 5,
            b: -4,
            c: 99999999
        };
    }
}