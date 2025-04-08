struct Inner {
    i: Int;
    s: String;
    b: Bool;
}

contract MultiPrimitives {
    a: Int;
    b: String;
    c: Bool;
    inner: Inner;

    init() {
        self.a = 12;
        self.b = "abc";
        self.c = true;
        self.inner = Inner{i:1, s:"x", b:false};
    }
}
