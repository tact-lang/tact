struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: String;
}

struct S3 {
    s2: S2;
    c: Bool;
}

contract TestContract {
    f: S3;
    init() {
        self.f = S3{
            s2: S2{s1: S1{a:1}, b:"str"},
            c: true
        };
    }
}
