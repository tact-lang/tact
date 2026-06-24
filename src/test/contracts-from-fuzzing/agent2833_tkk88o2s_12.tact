struct Nester {
    a: Int;
    b: Int?;
    c: InnerS;
}

struct InnerS {
    d: String;
    e: String?;
}

contract CrossOpt {
    payload: Nester;
    init() {
        self.payload = Nester{
            a: 4,
            b: null,
            c: InnerS{ d: "x", e: null }
        };
    }
}