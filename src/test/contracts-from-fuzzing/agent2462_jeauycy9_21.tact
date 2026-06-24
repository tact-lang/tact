struct S {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract T {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{f1:1,f2:true,f3:"a"};
        self.s2 = S{f1:2,f2:false,f3:"b"};
        self.s3 = S{f1:3,f2:true,f3:"c"};
    }
}