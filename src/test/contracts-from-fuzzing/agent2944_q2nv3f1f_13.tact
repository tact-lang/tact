struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    name: String;
}

contract DefaultVsAssign {
    record: S3;

    init() {
        self.record = S3{
            s2: S2{
                s1: S1{a: 7},
                flag: false
            },
            name: "XYZ"
        };
    }
}