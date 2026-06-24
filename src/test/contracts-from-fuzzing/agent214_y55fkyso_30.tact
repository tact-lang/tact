struct S1 { a: Int }
struct S2 { b: S1 }
struct S3 { c: S2 }

contract OptionalOuter {
    foo: S3?;
    
    init() {
        self.foo = S3{ c: S2{ b: S1{ a: 1 } } };
    }
}