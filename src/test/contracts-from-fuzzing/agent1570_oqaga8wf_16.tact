struct S1 { x: Int; }
struct S2 { x: S1; }
struct S3 { x: S2; }
struct S4 { x: S3; }
struct S5 { x: S4; }
struct S6 { x: S5; }

contract Deep6 {
    nested: S6;

    init() {
        self.nested = S6{ x: S5{ x: S4{ x: S3{ x: S2{ x: S1{ x: 42 } } } } } };
    }
}