// deeply nested optional contract parameter
struct S3 { val: Int; }
struct S2 { inner: S3?; }
struct S1 { inner: S2?; }
contract TestParam(
    data: S1?
) {}