struct SInner {
    a: Int;
    b: Bool;
}

struct SOuter {
    x: Int;
    y: Bool;
    inner: SInner;
}

contract TestContract {
    val: SOuter;

    init() {
        self.val = SOuter{
            x: 5,
            y: true,
            inner: SInner{
                a: 10,
                b: false,
            },
        };
    }
}