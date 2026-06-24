struct SerializationStruct {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint1;
    d: Int as int257;
}

contract SerializationComplex {
    s: SerializationStruct;

    init() {
        self.s = SerializationStruct{
            a:1, b:-1, c:1, d:-123456789
        };
    }
}
