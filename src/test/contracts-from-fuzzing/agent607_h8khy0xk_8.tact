struct S1 {
    f1: Int;
    f2: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

contract RepeatedNested {
    value: S3;

    init() {
        self.value = S3{
            s2a: S2{ s1a: S1{f1:1,f2:2}, s1b: S1{f1:3,f2:4} },
            s2b: S2{ s1a: S1{f1:5,f2:6}, s1b: S1{f1:7,f2:8} }
        };
    }
}