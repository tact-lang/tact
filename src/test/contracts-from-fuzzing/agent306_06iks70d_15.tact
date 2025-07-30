struct S1 {
    a: Int;
}
struct S2 {
    s1: S1;
    b: Int;
}
struct S3 {
    s2: S2;
    c: Int;
}

contract NestedOrdering {
    record: S3;

    init() {
        self.record = S3{
            s2: S2{
                s1: S1{a: 11},
                b: 22
            },
            c: 33
        };
    }
}
