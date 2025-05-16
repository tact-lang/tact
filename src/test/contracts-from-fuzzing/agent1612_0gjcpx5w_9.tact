struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract MutuallyRecursiveLike {
    value: S3;

    init() {
        self.value = S3{
            s: S2{
                s: S1{
                    a: 10,
                }
            }
        };
    }
}
