struct S1 {
    a: Int;
    b: Int;
    c: Int;
}

struct S2 {
    s: S1;
    x: Int;
}

struct S3 {
    s: S2;
    y: Int;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            s: S2{
                s: S1{
                    a: 1,
                    b: 2,
                    c: 3,
                },
                x: 4,
            },
            y: 5,
        };
    }
}
