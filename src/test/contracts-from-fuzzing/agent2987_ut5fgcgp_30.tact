struct DeeplyNested {
    s1: S1;
}

struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    s5: S5;
}

struct S5 {
    s6: S6;
}

struct S6 {
    s7: S7;
}

struct S7 {
    x: Int;
}

contract Deep7 {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s1: S1{ s2:S2{ s3:S3{ s4:S4{ s5:S5{ s6:S6{ s7:S7{ x:777 } } } } } } }
        };
    }
}
