struct S1 { a: Int }
struct S2 { b: S1 }
struct S3 { c: S2 }

contract DeepChain {
    field: S3;

    init() {
        self.field = S3{ c: S2{ b: S1{ a: 7 } } };
    }
}