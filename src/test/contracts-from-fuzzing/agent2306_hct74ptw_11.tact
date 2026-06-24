struct SerializeSpec {
    a: Int as uint64;
    b: Int as uint32;
    c: Int as int8;
    d: Bool;
    e: String;
}

contract SerializationFields {
    s: SerializeSpec;
    
    init() {
        self.s = SerializeSpec{
            a:1, b:2, c:3, d:true, e:"ok"
        };
    }
}
