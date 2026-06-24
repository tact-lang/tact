struct Inner {
    foo: Int;
    bar: Bool;
}

contract TwoVars {
    data1: Inner;
    data2: Inner;

    init() {
        self.data1 = Inner{ foo: 1, bar: true };
        self.data2 = Inner{ foo: 2, bar: false };
    }
}