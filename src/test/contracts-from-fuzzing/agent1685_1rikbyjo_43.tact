struct AllIntSerialized {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int16;
    d: Int as int257;
}

contract SerializeMix {
    s: AllIntSerialized;

    init() {
        self.s = AllIntSerialized{
            a:1,b:2,c:3,d:4
        };
    }
}
