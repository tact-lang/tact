struct Inner {
    a: Int;
    b: Int?;
}

contract StructArray {
    s0: Inner;
    s1: Inner;
    s2: Inner;
    s3: Inner;
    s4: Inner;

    init() {
        self.s0 = Inner{ a:0, b:null };
        self.s1 = Inner{ a:1, b:2 };
        self.s2 = Inner{ a:3, b:null };
        self.s3 = Inner{ a:4, b:5 };
        self.s4 = Inner{ a:6, b:null };
    }
}