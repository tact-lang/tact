struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
}

struct S3 {
    b: S2;
}

struct S4 {
    c: S3;
}

contract TestContract {
    deeplyNested: S4;

    init() {
        self.deeplyNested = S4{
            c: S3{
                b: S2{
                    a: S1{
                        x: 123
                    }
                }
            }
        };
    }
}