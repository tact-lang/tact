struct S1 {
    x: Int;
}

struct S2 {
    x: Int;
    s1: S1;
}

struct S3 {
    s1: S1;
    s2: S2;
}

contract WideNested {
    val: S3;
    init() {
        self.val = S3{
            s1: S1{ x: 5 },
            s2: S2{ x: 10, s1: S1{ x: 20 } }
        };
    }
}