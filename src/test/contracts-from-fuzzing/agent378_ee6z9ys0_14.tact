struct S1 {
    a: Bool;
}

struct S2 {
    s1: S1;
    b: Int;
}

struct S3 {
    s2: S2;
    c: Bool;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            s2: S2{ s1: S1{a:true}, b:17 },
            c: false
        };
    }
}