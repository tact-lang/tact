struct SerialOpts {
    a: Int? as uint8;
    b: Int? as int16;
}

contract OptSerialization {
    s: SerialOpts;

    init() {
        self.s = SerialOpts{ a:null, b:null };
    }
}