struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            z: S2{
                y: S1{
                    x: -100
                }
            }
        };
    }
}