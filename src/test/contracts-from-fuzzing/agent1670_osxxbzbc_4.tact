struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyPersistents {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1 = S{ a:1, b:true, c:"hi" };
        self.s2 = S{ a:2, b:false, c:"there" };
        self.s3 = S{ a:3, b:true, c:"friend" };
        self.s4 = S{ a:4, b:false, c:"!" };
        self.s5 = S{ a:5, b:true, c:"!" };
    }
}