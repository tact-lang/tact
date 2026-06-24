struct InnerA {
    x: Int;
    y: Bool;
}

struct InnerB {
    u: String;
    v: Int;
}

struct OuterMany {
    a: InnerA;
    b: InnerB;
    c: Bool;
    d: String?;
}

contract MixedStructs {
    state: OuterMany = OuterMany{
        a: InnerA{x:1, y:true},
        b: InnerB{u:"abc", v:5},
        c: false,
        d: null
    };

    init() {
        self.state = OuterMany{
            a: InnerA{x:42, y:false},
            b: InnerB{u:"zzz", v:100},
            c: true,
            d: "set"
        };
    }
}
