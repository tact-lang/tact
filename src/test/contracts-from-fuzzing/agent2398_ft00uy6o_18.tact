struct MixedSer {
    a: Int as uint32;
    b: String;
    c: Int?;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    s: MixedSer;

    init() {
        self.s = MixedSer{
            a: 1,
            b: "hi",
            c: null,
            d: null,
            e: true,
            f: false
        };
    }
}