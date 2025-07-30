struct Complex {
    n: Int;
    flag: Bool;
    txt: String;
    optNum: Int?;
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    value: Int;
    label: String?;
}

contract MultiComplex {
    c1: Complex;
    c2: Complex;
    c3: Complex;

    init() {
        let inner1 = Inner{ value: 11, label: "foo" };
        let inner2 = Inner{ value: 22, label: null };
        self.c1 = Complex{ n: 1, flag: true, txt: "one", optNum: null, inner: inner1, optInner: null };
        self.c2 = Complex{ n: 2, flag: false, txt: "two", optNum: 42, inner: inner2, optInner: inner1 };
        self.c3 = Complex{ n: 3, flag: true, txt: "three", optNum: null, inner: inner1, optInner: inner2 };
    }
}