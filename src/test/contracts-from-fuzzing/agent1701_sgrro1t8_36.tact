struct SInner {
    x: Int;
    y: Bool;
}

struct SOuter {
    a: Int;
    inner: SInner;
}

contract NestedStructTest {
    state: SOuter;

    init() {
        self.state = SOuter{
            a: 3,
            inner: SInner{
                x: 4,
                y: true
            }
        };
    }
}