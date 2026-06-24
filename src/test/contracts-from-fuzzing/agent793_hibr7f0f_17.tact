struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
}
struct S3 {
    s1: S1;
    s2: S2;
}

contract MultiEmbed {
    st: S3;
    init() {
        self.st = S3{
            s1: S1{a: 1},
            s2: S2{b: 2},
        };
    }
}