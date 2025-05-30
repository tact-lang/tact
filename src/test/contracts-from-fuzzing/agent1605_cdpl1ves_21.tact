struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract NestedThree {
    data: S3;

    init() {
        self.data = S3{
            c: S2{
                b: S1{
                    a: 123
                }
            }
        };
    }
}