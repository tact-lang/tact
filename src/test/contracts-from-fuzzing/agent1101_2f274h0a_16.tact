struct S1 {
    x: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

struct S4 {
    inner: S3;
}

contract DeepTower {
    s: S4;

    init() {
        self.s = S4{
            inner: S3{
                inner: S2{
                    inner: S1{ x: 5 }
                }
            }
        };
    }
}