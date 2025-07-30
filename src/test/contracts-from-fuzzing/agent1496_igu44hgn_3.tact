struct Inner {
    a: Int;
    opt: Int?;
}

contract TestContract {
    data1: Inner;
    data2: Inner;
    init() {
        self.data1 = Inner{ a: 2, opt: 3 };
        self.data2 = Inner{ a: 4, opt: null };
    }
}