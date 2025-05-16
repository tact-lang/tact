struct SInner {
    a: Int;
    b: Bool;
}

struct SOuter {
    s: SInner;
    sOpt: SInner?;
}

contract OptionalStructField {
    data: SOuter;

    init() {
        self.data = SOuter {
            s: SInner { a: 10, b: false },
            sOpt: null
        };
    }
}