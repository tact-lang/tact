struct SInner {
    z: String;
}

struct SOuter {
    a: Int;
    b: String;
    c: Bool;
    d: SInner;
    e: Bool?;
    f: String?;
}

contract TestContract {
    stuff: SOuter;

    init() {
        self.stuff = SOuter{
            a: 4,
            b: "hey",
            c: true,
            d: SInner{z:"zval"},
            e: null,
            f: null
        };
    }
}