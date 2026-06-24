struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract Test14 {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ a:1, b:true, c:"x" };
        self.s2 = S{ a:2, b:false, c:"y" };
        self.s3 = S{ a:3, b:true, c:"z" };
    }
}