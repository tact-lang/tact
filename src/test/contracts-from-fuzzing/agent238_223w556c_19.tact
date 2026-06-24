struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 {
    a: S3;
    opt: S2?;
}

contract Combo {
    field: S4;

    init() {
        self.field = S4{
            a: S3{a: S2{a: S1{a: 1}}},
            opt: null
        };
    }
}