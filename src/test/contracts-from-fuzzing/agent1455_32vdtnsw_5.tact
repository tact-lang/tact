struct S1 {
    a: Int = 1;
}

struct S2 {
    b: Bool = true;
}

struct S3 {
    c: String = "";
}

contract TestContract {
    x: S1 = S1{};
    y: S2 = S2{};
    z: S3 = S3{};
    init() {}
}
