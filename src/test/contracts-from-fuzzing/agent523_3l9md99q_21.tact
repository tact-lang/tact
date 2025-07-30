struct OuterRemain {
    p: Int;
    inner: InnerRemain;
}

struct InnerRemain {
    q: Int;
    r: Cell as remaining;
}

contract NestedRemainingContract {
    o: OuterRemain;
    init() {
        self.o = OuterRemain{
            p:8,
            inner: InnerRemain{q:9,r:emptyCell()}
        };
    }
}