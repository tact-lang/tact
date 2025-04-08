struct SerialOpts {
    a: Int? as uint8;
    b: Int as int32;
    c: Int? as int4;
}

contract OptSerialize {
    stuff: SerialOpts;

    init() {
        self.stuff = SerialOpts{
            a: null,
            b: 1000,
            c: null
        };
    }
}