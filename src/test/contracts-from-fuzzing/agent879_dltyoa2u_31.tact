struct SInner {
    x: Int;
    y: String;
}

struct SOuter {
    a: SInner;
    b: SInner;
    c: SInner;
}

contract MultiSameNested {
    s: SOuter;
    init() {
        self.s = SOuter{
            a:SInner{ x:1, y:"a" },
            b:SInner{ x:2, y:"b" },
            c:SInner{ x:3, y:"c" }
        };
    }
}
