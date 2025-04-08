struct S1 {
    a: Int;
}

struct S2 {
    inner: S1;
    b: Int;
}

struct S3 {
    nested: S2;
    c: Int;
}

contract MultipleNestedDeep {
    val: S3;

    init() {
        self.val = S3{
            nested: S2{
                inner: S1{ a: 5 },
                b: 6
            },
            c: 7
        };
    }
}
