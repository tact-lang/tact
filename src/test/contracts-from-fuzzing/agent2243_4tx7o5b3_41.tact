struct S1 {
    val: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract MultiStructs {
    data: S3;

    init() {
        self.data = S3{s2: S2{s1: S1{val:123}}};
    }
}
