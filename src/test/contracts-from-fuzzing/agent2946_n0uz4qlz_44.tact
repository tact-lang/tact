struct OuterS {
    inner: SInner;
}

struct SInner {
    x: Int;
    y: Bool;
}

contract NestedStructStorage {
    s: OuterS;
    init() {
        self.s = OuterS{
            inner: SInner{
                x: 5,
                y: true
            }
        };
    }
}