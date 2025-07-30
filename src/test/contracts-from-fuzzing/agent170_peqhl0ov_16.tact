contract TestContract {
    s: String = "hi";
    s2: String = "there";
    s3: String = "world";
    b: Bool = true;
    b2: Bool = false;
    n: Int = 123;

    init() {
        self.s = "foo";
        self.s2 = "bar";
        self.s3 = "baz";
        self.b = false;
        self.b2 = true;
        self.n = 321;
    }

    receive() {
        let _ = self.s3;
    }
}