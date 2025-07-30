struct S1 {
    x: Int = 1;
}

struct S2 {
    s1: S1 = S1{};
}

struct S3 {
    s2: S2 = S2{};
}

contract DefaultsNested {
    data: S3;

    init() {
        self.data = S3{};
    }
}