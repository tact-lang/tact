struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract Test {
    field1: Int;
    inner: Inner;
    flag: Bool;

    init() {
        self.field1 = 5;
        self.inner = Inner{ a: 10, b: false, c: null };
        self.flag = true;
    }
}