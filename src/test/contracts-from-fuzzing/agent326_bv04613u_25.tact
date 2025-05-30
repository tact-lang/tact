struct ParamS {
    a: Int as int8;
    b: Int as uint32;
    c: Int as coins;
}

contract SerializedFields {
    s: ParamS;

    init() {
        self.s = ParamS{
            a: 10,
            b: 123,
            c: ton("1")
        };
    }
}
