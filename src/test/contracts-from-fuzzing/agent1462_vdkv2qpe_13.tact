struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayLike {
    s0: S;
    s1: S;
    s2: S;

    init() {
        self.s0 = S{ a:0, b:true, c:"a" };
        self.s1 = S{ a:1, b:false, c:"b" };
        self.s2 = S{ a:2, b:true, c:"c" };
    }
}