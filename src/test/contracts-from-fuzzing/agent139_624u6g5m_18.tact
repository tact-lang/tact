struct S1 { x: Int }
struct S2 { y: String }
struct S3 { z: Bool }

struct Combo2 {
    a: S1;
    b: S2;
    c: S3;
    d: Int?;
}

contract ComplexNestedOpt {
    val: Combo2;

    init() {
        self.val = Combo2{
            a: S1{ x: 1 },
            b: S2{ y: "y" },
            c: S3{ z: false },
            d: null
        };
    }
}