struct SInner {
    count: Int as uint16;
}

struct SOuter {
    inner: SInner;
    maybe: Bool?;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner: SInner{ count: 42 },
            maybe: null,
        };
    }

    receive() {}
}