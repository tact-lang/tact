struct SInner {
    a: Int;
    b: Bool;
    c: String;
}

struct SOuter {
    inner: SInner;
    optInner: SInner?;
}

contract ComplexContract {
    state: SOuter;

    init() {
        self.state = SOuter{
            inner: SInner{ a:1, b:true, c:"hi" },
            optInner: null,
        };
    }
}