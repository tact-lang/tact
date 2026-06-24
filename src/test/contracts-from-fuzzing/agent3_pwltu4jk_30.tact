// Complex contract persistent storage mixing struct, nested struct, optionals
struct SInner {
    c: Int;
    d: Bool?;
}

struct SMid {
    a: SInner;
    b: Int?;
}

contract ComplexMix {
    mid: SMid;
    s: String?;
    f: Address;

    init() {
        self.mid = SMid{
            a: SInner{
                c: 77,
                d: null
            },
            b: 99
        };
        self.s = "string";
        self.f = myAddress();
    }
}