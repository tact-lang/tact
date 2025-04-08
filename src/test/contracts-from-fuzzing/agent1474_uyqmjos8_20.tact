struct MixLevel {
    a: Int;
    b: Inner1;
    c: Int?;
    d: Inner2;
}

struct Inner1 {
    val: Int;
    opt: String?;
}

struct Inner2 {
    flag: Bool;
    maybe: Bool?;
}

contract Test19 {
    m: MixLevel;
    init() {
        self.m = MixLevel{
            a: 1,
            b: Inner1{ val:2, opt:null },
            c: null,
            d: Inner2{ flag: true, maybe: null }
        };
    }
}