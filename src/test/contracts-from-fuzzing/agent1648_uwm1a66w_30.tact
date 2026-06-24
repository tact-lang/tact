struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 { a: S3; }
struct S5 { a: S4; }

contract Chain5 {
    s: S5;

    init() {
        self.s = S5{ a: S4{ a: S3{ a: S2{ a: S1{ a: 7 } } } } };
    }
}