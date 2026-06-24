struct SInner {
    x: Int = 1;
    y: Bool?;
}
struct SOuter {
    a: Int = 2;
    b: Bool?;
    inner: SInner?;
}

contract TestContract {
    st: SOuter;

    init() {
        self.st = SOuter{
            a: 10,
            b: null,
            inner: SInner{
                x: 20,
                y: true,
            },
        };
    }
}