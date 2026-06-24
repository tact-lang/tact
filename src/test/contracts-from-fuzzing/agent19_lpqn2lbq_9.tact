struct S1 { x: Int }

struct S2 {
    f1: S1;
    f2: S1;
}

struct S3 {
    f3: S2;
    f4: S2;
}

struct S4 {
    f5: S3;
    f6: S3;
}

contract TestContract {
    val: S4;

    init() {
        self.val = S4{
            f5: S3{
                f3: S2{f1:S1{x:1}, f2:S1{x:2}},
                f4: S2{f1:S1{x:3}, f2:S1{x:4}},
            },
            f6: S3{
                f3: S2{f1:S1{x:5}, f2:S1{x:6}},
                f4: S2{f1:S1{x:7}, f2:S1{x:8}},
            }
        };
    }
}