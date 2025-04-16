struct S1 {
    x: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract Test5 {
    deep: S3;

    init() {
        self.deep = S3 {
            inner: S2 {
                inner: S1 {
                    x: 99
                }
            }
        };
    }
}
