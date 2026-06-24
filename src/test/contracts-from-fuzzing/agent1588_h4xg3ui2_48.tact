struct MixOptReq {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixOptReqTest {
    v: MixOptReq;
    init() {
        self.v = MixOptReq{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null
        };
    }
}