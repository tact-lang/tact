struct S1 {
    f1: Int;
}

struct S2 {
    f2: S1;
}

struct S3 {
    f3: S2;
}

contract Deep {
    deepfield: S3?;
}