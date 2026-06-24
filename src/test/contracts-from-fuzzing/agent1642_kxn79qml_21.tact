struct S1 {
    v: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract DeepInit {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{
                inner: S1{
                    v: 777
                }
            }
        };
    }
}