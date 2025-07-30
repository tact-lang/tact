struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    c: S1;
}

struct S3 {
    d: Int;
    e: S2;
}

contract DeepHierarchyTest {
    field: S3;

    init() {
        self.field = S3{
            d: 10,
            e: S2{
                b: 20,
                c: S1{
                    a: 30,
                },
            },
        };
    }
}