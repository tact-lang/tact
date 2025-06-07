struct S1 {
    x: Int = 1;
}

struct S2 {
    s1: S1 = S1{};
}

struct S3 {
    s2: S2 = S2{};
}

struct S4 {
    s3: S3 = S3{};
}

struct S5 {
    s4: S4 = S4{};
}

contract TestContract {
    deep: S5 = S5{};
    init() {}
    receive() {
        let _ = self.deep.s4.s3.s2.s1.x;
    }
}