struct MixedSerialize {
    a: Int;
    b: Int as uint32;
    c: Int?;
    d: Int? as uint32;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    m: MixedSerialize;
    init() {
        self.m = MixedSerialize{ a:1, b:2, c:null, d:null, e:true, f:null };
    }
}