struct MixSer {
    i8: Int as int8;
    u64: Int as uint64;
    i: Int;
    b: Bool;
    s: String;
}

contract MixedSerialization {
    f: MixSer;
    
    init() {
        self.f = MixSer{
            i8:-5,
            u64:500,
            i:12345,
            b:true,
            s:"serialize"
        };
    }
}