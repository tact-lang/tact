struct MixSer {
    a: Int as int64;
    b: Int as uint4;
    c: Int;
}

contract SerMix {
    s: MixSer;

    init() {
        self.s = MixSer{a:1,b:2,c:3};
    }
}