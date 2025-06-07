struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int?;
}

struct S3 {
    flag: Bool;
    data: S2;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            flag: false,
            data: S2{
                s1: S1{x: 10},
                y: null
            }
        };
    }
}