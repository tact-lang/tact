struct S1 {
    a: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

struct S4 {
    inner: S3;
}

contract DeepFourNested {
    val: S4;

    init() {
        self.val = S4{
            inner: S3{
                inner: S2{
                    inner: S1{
                        a: 1,
                    },
                },
            },
        };
    }
}
