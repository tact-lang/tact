struct SInner {
    value: Int;
    note: String;
}

struct SOuter {
    optInner: SInner?;
    ready: Bool;
}

contract OptionalStructFieldTest {
    data: SOuter;
    init() {
        self.data = SOuter{
            optInner: null,
            ready: false,
        };
    }
}
