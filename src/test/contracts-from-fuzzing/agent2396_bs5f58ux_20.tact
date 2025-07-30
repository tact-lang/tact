struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Multi {
    inner1: Inner;
    inner2: Inner;

    init() {
        self.inner1 = Inner{ a:1, b:true, c:"x" };
        self.inner2 = Inner{ a:2, b:false, c:"y" };
    }
}
