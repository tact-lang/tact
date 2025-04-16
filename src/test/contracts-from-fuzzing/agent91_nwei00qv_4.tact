struct S1 {
    a: Int = 1;
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

struct S5 {
    e: S4 = S4{};
}

contract TestContract {
    level5: S5 = S5{};
    
    init() {}
}
