struct S3 {
    x: Int;
}

struct S2 {
    y: Int;
    z: S3;
}

struct S1 {
    a: Int;
    b: S2;
}

contract MultilevelStructs {
    data: S1;

    init() {
        self.data = S1{
            a:1,
            b:S2{
                y:2,
                z:S3{
                    x:3
                }
            }
        };
    }
}
