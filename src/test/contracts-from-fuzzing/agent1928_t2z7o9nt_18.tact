struct SInner { f: Bool; }

struct SOuter {
    a: Int;
    b: SInner;
    c: SInner;
    d: SInner;
}

contract ManyStructs {
    v: SOuter;

    init() {
        self.v = SOuter{
            a: 1,
            b: SInner{f:true},
            c: SInner{f:false},
            d: SInner{f:true}
        };
    }
}