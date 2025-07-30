struct S1 {
    n: Int;
}

struct S2 {
    s: String;
}

struct S3 {
    s1: S1;
    s2: S2;
}

contract CompositeStructs {
    field: S3;

    init() {
        self.field = S3{s1:S1{n:5}, s2:S2{s:"x"}};
    }
}