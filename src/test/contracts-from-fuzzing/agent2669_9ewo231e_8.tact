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

contract ManyNested {
    val: S3;

    init() {
        self.val = S3{
            d: 1,
            e: S2{
                b: 2,
                c: S1{
                    a: 3,
                },
            },
        };
    }
}
