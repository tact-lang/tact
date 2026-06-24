struct S1 {
    inner: Int;
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

contract DeeplyNested {
    data: S4;
    init() {
        self.data = S4{inner: S3{inner: S2{inner: S1{inner:123}}}};
    }
}