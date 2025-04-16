struct S1 {
    a: Int = 10;
}

struct S2 {
    b: S1 = S1{};
}

struct S3 {
    c: S2 = S2{};
}

struct S4 {
    d: S3 = S3{};
}

contract TestContract {
    val: S4;
    init() {
        self.val = S4{};
    }
    receive() {}
}