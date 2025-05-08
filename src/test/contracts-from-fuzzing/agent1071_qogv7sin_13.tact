struct S0 { a: Int }
struct S1 { a: S0 }
struct S2 { a: S1 }
struct S3 { a: S2 }
struct S4 { a: S3 }
struct S5 { a: S4 }

contract DeepFlat {
    data: S5;

    init() {
        self.data = S5{ a: S4{ a: S3{ a: S2{ a: S1{ a: S0{ a: 42 } } } } } };
    }
}