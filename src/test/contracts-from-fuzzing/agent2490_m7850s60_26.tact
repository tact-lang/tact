struct S {
    a: Int;
    b: Bool;
}

contract SArrayTest {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{a:1, b:true};
        self.s2 = S{a:2, b:false};
        self.s3 = S{a:3, b:true};
    }
}