struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s: S1;
    c: Int;
}

struct S3 {
    s: S2;
    d: Int;
}

contract DeepChain {
    val: S3;

    init() {
        self.val = S3{ s: S2{ s: S1{a:1,b:2}, c:3 }, d:4 };
    }
}
