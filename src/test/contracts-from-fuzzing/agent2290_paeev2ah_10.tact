struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract Test10 {
    val: S3;

    init() {
        self.val = S3{
            c: S2{
                b: S1{
                    a: 100
                }
            }
        };
    }
}