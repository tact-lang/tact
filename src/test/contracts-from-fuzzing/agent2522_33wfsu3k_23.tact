struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: Int;
    y: S1;
}

struct S3 {
    s: S2;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3 {
            s: S2 {
                x: 42,
                y: S1 {
                    a: 1,
                    b: false
                }
            }
        };
    }
}