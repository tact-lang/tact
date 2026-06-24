struct S {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract ArrayLike {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1 = S{ f1:1, f2:true, f3:"x" };
        self.s2 = S{ f1:2, f2:false, f3:"y" };
        self.s3 = S{ f1:3, f2:true, f3:"z" };
        self.s4 = S{ f1:4, f2:false, f3:"w" };
        self.s5 = S{ f1:5, f2:true, f3:"v" };
    }
}