struct SOpt {
    i: Int?;
    s: String?;
    b: Bool?;
}

struct SReq {
    i: Int;
    s: String;
    b: Bool;
}

contract OptMix {
    a: SReq;
    b: SOpt;
    init() {
        self.a = SReq{ i: 5, s: "hello", b: false };
        self.b = SOpt{ i: null, s: null, b: null };
    }
}
