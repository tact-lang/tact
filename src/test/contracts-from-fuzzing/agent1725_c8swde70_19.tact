struct MismatchSerialized {
    a: Int as uint16;
    b: Int as int64;
    c: Int as uint8;
    d: Int;
    e: Int as uint32;
    f: Int as int8;
}

contract SerialMismatch {
    v: MismatchSerialized;

    init() {
        self.v = MismatchSerialized{
            a:5,b:6,c:7,d:8,e:9,f:10
        };
    }
}