struct S1 { x: Int; }
struct S2 { x: S1; }
struct S3 { x: S2; }
struct S4 { x: S3; }

contract DeepStruct {
    root: S4 = S4{ x: S3{ x: S2{ x: S1{ x: 123 } } } };
}