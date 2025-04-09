struct S1 {
    n: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract NestedUpdate {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{
                inner: S1{ n: 0 }
            }
        };
    }

    receive() {
        self.data.inner.inner = S1{ n: 42 };
    }
}