struct SInner {
    a: Int; b: Bool;
}

struct SOuter {
    x: SInner?;
    y: SInner?;
}

contract TestOptNested {
    s: SOuter;

    init() {
        self.s = SOuter{
            x: null,
            y: SInner{a:10, b:true}
        };
    }
}