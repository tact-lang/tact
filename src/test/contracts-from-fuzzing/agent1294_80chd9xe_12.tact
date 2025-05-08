struct MixedSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int257;
    e: Bool;
    f: Bool?;
    g: String;
    h: String?;
}

contract Serialization {
    data: MixedSerialize;

    init() {
        self.data = MixedSerialize{
            a:255, b:-1234, c:4294967295, d:-1,
            e:true, f:null, g:"hello", h:null
        };
    }
}
