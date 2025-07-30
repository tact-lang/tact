struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
    val: Int;
}

contract NestedManyFields {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                b: 17,
                s1: S1{ a: 42 }
            },
            val: 99
        };
    }
}
