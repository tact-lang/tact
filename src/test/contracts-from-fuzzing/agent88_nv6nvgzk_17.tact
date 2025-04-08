struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract TestContract {
    deep: S3;

    init() {
        self.deep = S3 {
            s: S2 {
                s: S1 {
                    a: 42
                }
            }
        };
    }
}