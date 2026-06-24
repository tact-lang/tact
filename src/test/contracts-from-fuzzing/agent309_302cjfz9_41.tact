struct S1 {
    a: Int;
}
struct S2 {
    s1: S1;
}
struct S3 {
    s2: S2;
}
contract MultiLevelNesting {
    r: S3;
    init() {
        self.r = S3{ s2: S2{ s1: S1{ a:100 } } };
    }
}