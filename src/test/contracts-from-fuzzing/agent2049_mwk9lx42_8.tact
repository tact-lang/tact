struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract Test {
    deep: S3;

    init() {
        self.deep = S3{
            s2: S2{
                s1: S1{ x: 123 }
            }
        };
    }
}