struct InnerMost {
    a: Int;
}

struct Inner {
    m: Int?;
    n: InnerMost;
}

contract Test {
    data1: Inner;
    data2: Inner;
    data3: Int;

    init() {
        self.data1 = Inner{ m: null, n: InnerMost{ a: 1 } };
        self.data2 = Inner{ m: null, n: InnerMost{ a: 2 } };
        self.data3 = 3;
    }
}