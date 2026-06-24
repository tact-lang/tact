struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract StorageTest {
    val1: Int = 1;
    val2: Bool = false;
    val3: String = "A";
    inner: Inner = Inner{ a: 5, b: true, c: null };

    init() {
        self.val3 = "B";
        self.inner = Inner{ a: 6, b: false, c: "X" };
    }
}
