struct InnerA {
    p: Int;
    q: Bool;
}

struct InnerB {
    s: String;
    t: Address;
}

struct BigNested {
    a: InnerA;
    b: InnerB;
    c: Int;
}

contract BigMix {
    field: BigNested;

    init() {
        self.field = BigNested{
            a: InnerA{ p:1,q:true },
            b: InnerB{ s: "ok", t: myAddress() },
            c: 22
        };
    }
}
