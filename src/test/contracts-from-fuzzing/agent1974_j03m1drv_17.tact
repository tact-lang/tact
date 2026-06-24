struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract MultipleVars {
    v1: S;
    v2: S;
    v3: S;
    v4: S;

    init() {
        self.v1 = S{ a:1, b:true, c:null };
        self.v2 = S{ a:2, b:false, c:null };
        self.v3 = S{ a:3, b:true, c:4 };
        self.v4 = S{ a:5, b:false, c:6 };
    }
}
