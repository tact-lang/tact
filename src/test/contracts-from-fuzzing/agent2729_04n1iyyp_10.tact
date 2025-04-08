struct SInner {
    foo: Int?;
    bar: String?;
}

struct SOuter {
    inner1: SInner?;
    inner2: SInner?;
    flag: Bool;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner1: null,
            inner2: null,
            flag: false,
        };
    }
}