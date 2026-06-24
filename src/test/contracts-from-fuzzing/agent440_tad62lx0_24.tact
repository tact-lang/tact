struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ a:1,b:true,c:"A" };
        self.s2 = S{ a:2,b:false,c:"B" };
        self.s3 = S{ a:3,b:true,c:"C" };
    }
}