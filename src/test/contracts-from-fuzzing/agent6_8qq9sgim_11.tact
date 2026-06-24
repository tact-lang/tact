struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }
struct S5 { s: S4 }

contract DeepChain {
    chainField: S5;

    init() {
        self.chainField = S5{ s: S4{ s: S3{ s: S2{ s: S1{ a: 1 } } } } };
    }
}