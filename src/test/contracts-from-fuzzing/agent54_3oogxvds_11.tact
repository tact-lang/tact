struct BigInner {
    a: Int;
    b: Int;
    c: Int;
}

struct BigOuter {
    inner1: BigInner;
    inner2: BigInner;
    inner3: BigInner;
    inner4: BigInner;
}

contract LotsOfNested {
    state: BigOuter;
    init() {
        self.state = BigOuter{
            inner1: BigInner{a:1,b:2,c:3},
            inner2: BigInner{a:4,b:5,c:6},
            inner3: BigInner{a:7,b:8,c:9},
            inner4: BigInner{a:10,b:11,c:12},
        };
    }
}