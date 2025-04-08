struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    s: Inner;
    init() {
        self.s = Inner{ a:1, b:true, c:"x" };
    }
}