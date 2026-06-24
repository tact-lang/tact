struct S1 {
    a: Int;
    b: S2?;
}

struct S2 {
    c: Int;
    d: S3?;
}

struct S3 {
    e: Int;
}

contract OptionalChain {
    val: S1?;

    init() {
        self.val = S1{
            a: 1,
            b: S2{
                c: 2,
                d: S3{ e: 3 }
            }
        };
    }
}