struct SInner {
    i: Int = 7;
}

struct SOuter {
    inner: SInner = SInner{};
    f: Bool;
}

contract DefNest {
    data: SOuter;
    init() {
        self.data = SOuter{
            f: true
        };
    }
}
