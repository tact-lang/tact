struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    inner: S1;
}

struct S3 {
    wrapped: S2;
}

contract NestedInline {
    val: S3;
    init() {
        self.val = S3{
            wrapped: S2{
                inner: S1{ x:7, y:false }
            }
        };
    }
}