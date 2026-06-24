struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
    b: Int;
}

struct S3 {
    c: Int;
    d: S2;
}

contract ManyNestOptions {
    s: S3;

    init() {
        self.s = S3{
            c: 5,
            d: S2{
                a: S1{ x: 1 },
                b: 2
            }
        };
    }
}
