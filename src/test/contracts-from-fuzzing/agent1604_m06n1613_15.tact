struct S3 {
    next: S2;
}

struct S2 {
    inner: S1;
}

struct S1 {
    val: Int;
}

contract MultiLink {
    data: S3 = S3 { next: S2 { inner: S1 { val: 777 } } };

    receive() {}
}