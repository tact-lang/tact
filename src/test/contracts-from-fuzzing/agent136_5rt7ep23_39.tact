struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Different {
    s1: Inner;
    s2: Inner;

    init() {
        self.s1 = Inner{ a:5, b:true, c:"hi" };
        self.s2 = Inner{ a:6, b:false, c:"ho" };
    }
}