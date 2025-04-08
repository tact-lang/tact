struct Inner {
    a: Int;
    b: Int?;
}

contract Test1 {
    val1: Int;
    val2: Bool;
    val3: String;
    inner: Inner;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "hi";
        self.inner = Inner{ a: 7, b: null };
    }
}