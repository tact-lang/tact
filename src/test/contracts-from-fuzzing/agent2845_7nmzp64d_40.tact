struct Ser {
    a: Int as int64;
    b: Int as uint32;
    c: Int;
    d: Bool;
    e: String;
}

contract SerializationMix {
    s: Ser;

    init() {
        self.s = Ser{
            a:1, b:2, c:3, d:true, e:"ok"
        };
    }
}